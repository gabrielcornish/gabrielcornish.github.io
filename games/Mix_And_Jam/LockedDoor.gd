extends RichTextLabel

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
	if not Game.all_collected:
		print(area.get_parent().get_parent())
		visible = true
		get_node("Timer").start(3)
		
	if Game.all_collected && area.get_parent().get_parent().name == "Player":
		Game.game_over_door = true
		


func _on_Timer_timeout():
	visible = false
