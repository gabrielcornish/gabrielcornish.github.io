extends RichTextLabel

var speech = ["HEY KIDDO! I HEARD YOU FAILED AT SOMETHING TODAY...","AWWW!! THERE, THERE. IT'S OK!",
"YOU FELL ON YOUR FACE. SO WHAT!?", 
"FAILING IS A RIGHT OF PASSAGE!", "IT'S A PART OF YOUR DESTINY.","I KNOW IT'S HARD...",
"BUT AT LEAST YOU'RE STILL ALIVE...", "AND, YOU KNOW WHAT THAT MEANS!?",
"IT MEANS YOU STILL GOT A LOT OF FIGHT LEFT IN YA!",
"SO DUST YOURSELF OFF...", "GET BACK OUT THERE!", "I BELIEVE IN YOU!"]

var page = 0

func _ready():
	text = speech[page]
	pass 
	
func _process(delta):
	if Input.is_action_just_pressed("left_click"):
		if page < (speech.size()-1):
			page += 1
			text = speech[page]
			visible_characters = 0


func _on_SpeechTimer_timeout():
	visible_characters = visible_characters + 1
	pass # Replace with function body.
