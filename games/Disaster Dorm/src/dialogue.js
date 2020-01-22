State.variables.stack = []
State.variables.dialogue_passage = "diag"

window.getRawText = function(p){
  return Story.get(p).text.trim().split(/(?:\r?\n){2,}/);
}

window.splitRawText = function(p){
  return p.split(/\r?\n/);
}

window.loadStory = function(p){
  let raw = getRawText(p);

  let loaded_story =  raw.map(function(value,index,arr){
		//console.log(value)
    let text = splitRawText(value);
    let speaker = "";

    if(text[0].startsWith(">")){
      speaker = text[0].substring(1).trim();
      text.splice(0,1);
    }

    return {speaker:speaker, text:text[0]};
  });

  return loaded_story;
}

State.variables.stack = window.loadStory(State.variables.dialogue_passage);
console.log(State.variables.stack);
