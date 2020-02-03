State.variables.dialogue = []

$(document).on("mousedown", function (event) {
  if (event.which == 1){
    NextLine(State.variables.dialogue);
    $.wiki('<<scrolldown>>');
  }
});

window.RunDialogue = function(p){
  State.variables.dialogue = window.ParseDialogue(p);
  $.wiki('<<timed 5ms>><<run NextLine(State.variables.dialogue)>><</timed>>');
}

window.GetRawText = function(p){
  return Story.get(p).text.trim().split(/(?:\r?\n){2,}/);
}

window.SplitRawText = function(p){
  return p.split(/\r?\n/);
}

window.ParseDialogue = function(p){
  let raw = GetRawText(p);

  let loaded_story =  raw.map(function(value,index,arr){
		//console.log(value)
    let text = SplitRawText(value);
    let speaker = "";

    if(text[0].startsWith(">")){
      speaker = text[0].substring(1).trim();
      text.splice(0,1);
    }

    return {speaker:speaker, text:text[0]};
  });

  return loaded_story;
}

//DIRTY FUNCTION
window.NextLine = function(){
  if (State.variables.dialogue.length === 0){
    // insert end dialogue conditions
    return;
  }

  let load = State.variables.dialogue[0];

  $.wiki(`<<nobr>><<append ".passage" t8n>>
            <<speech "${load.speaker}">>
              ${load.text}
            <</speech>><br>
          <</append>><</nobr>>`
        );

  State.variables.dialogue.shift(0,1);
}

setup.speech = function(text="", speaker="") {
	//exits the function if there is no 'speech' data
	if (text === "") {return "";}

  let legend = "";
	let thought = "thought";
  let img = "";

	//decides whether it's a internal monologue, or external dialogue
	if (speaker) {
		legend = `<legend>${speaker}</legend>`;
		thought = "";
    img = `[img[${speaker}]]`
	}

	let output = `<div class="speech animated bounceInLeft"><fieldset>${legend}`;
	output += img;
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


console.log(State.variables.dialogue);
