extends Area2D

var can_be_clicked = true
var was_clicked = false
onready var sprite_to_alter = $AnimatedSprite

func _ready():
	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and can_be_clicked:
		if event.is_pressed():
			if event.get_button_index() == BUTTON_LEFT:
				self.is_clicked()
				
func is_clicked():
	was_clicked = true
	sprite_to_alter.animation = "alt"
	print("Is Clicked!")

