extends Area2D
var should_stop = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.get_owner().name == "Player Ship":
		area.get_owner().should_stop = true
		should_stop = true
		GameLogic.is_game_won = true
		print(GameLogic.is_game_won)
	pass # Replace with function body.
