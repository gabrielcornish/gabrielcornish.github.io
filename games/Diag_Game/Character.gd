extends Sprite

export (Texture) var face

export (Color) var color # COLOR OF THE TEXT

export (float, 0.1, 1.9) var voice_pitch # HOW HIGH / LOW THE VOICE IS

export (String, FILE) var interaction_script # A JSON DIALOGUE FILE


func _ready():
	pass	
	
func talk():
	MSG.start_dialogue(interaction_script, self)