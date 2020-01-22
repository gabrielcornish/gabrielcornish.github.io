State.variables.stack = []
State.variables.diag_done = false;

window.loadStory = function(p) {
	State.variables.stack = []
	State.variables.diag_done = false;

	let raw = Story.get(p).text.trim().split(/(?:\r?\n){2,}/);

  for (let i = 0; i < raw.length; i++) {
    let text = raw[i].split(/\r?\n/);

    let speaker = "";

    if (text[0].startsWith(">")) {
      speaker = text[0].substring(1).trim();
      text.splice(0,1);
    }

    for (let j = 0; j < text.length; j++) {
      let obj = {speaker: speaker, text: text[j]};
      State.variables.stack = [...State.variables.stack, obj];
    }
  }
}

//prints text onto screen from stack
window.advanceStory = function() {
  if (State.variables.stack.length === 0){
		/*dialogue tree end events not currently implemented, but they'd probably go in here*/
		State.variables.diag_done = true;
		return; }
  let load = State.variables.stack[0];

  //replaces the current bubble
  $.wiki(`<<nobr>><<append ".speech-container" t8n>>
            <<speech "${load.speaker}">>
              ${load.text}
            <</speech>><br>
          <</append>><</nobr>>`
        );
  State.variables.stack.shift(0,1);
}

//takes in the 'speech' text, and optionally, the speaker name. If no speaker is supplied, it's displayed as a thought or internal monologue
setup.speech = function(text="", speaker="") {
	//exits the function if there is no 'speech' data
	if (text === "") {return "";}

  let legend = "";
	let thought = "thought";

	//decides whether it's a internal monologue, or external dialogue
	if (speaker) {
		legend = `<legend>${speaker}</legend>`;
		thought = "";
	}

	let output = `<div class="speech"><fieldset>${legend}`;
	output += `<<include "${speaker}">>`
	output += `<span class="speech-bubble ${thought}">`;
	output += text;
	output += `</span></fieldset></div>`;

	return output;
}

Macro.add('speech', {
	tags     : null,
	handler  : function () {
		let text = this.payload[0].contents.trim();
		if (text === "") {return;}
		let speaker = (this.args.length > 0) ? this.args[0] : "";

		let output = setup.speech(text, speaker);

		$(this.output).wiki(output);
	}
});

Macro.add('scrolldown', {
	handler : function () {
		var target   = document.scrollingElement || 'html,body';
		var duration;

		if (this.args.length > 0) {
			switch (this.args[0]) {
			case 'fast':
			case 'slow':
				duration = this.args[0];
				break;
			default:
				try {
					duration = Math.max(Engine.minDomActionDelay, Util.fromCssTime(this.args[0]));
				}
				catch (ex) {
					return this.error(ex.message);
				}
				break;
			}
		}
		else {
			duration = 'slow';
		}

		setTimeout(function () {
			$(target).animate({
				scrollTop: $(document).height() - $(window).height()
			}, duration);
		}, Engine.minDomActionDelay);
	}
});
