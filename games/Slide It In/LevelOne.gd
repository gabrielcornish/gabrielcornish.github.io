extends Node2D
var current_score = 0
export var score_to_pass = 0
export var next_level = ""
var ready_to_change = false
var time_elapsed = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_score >= score_to_pass:
		ready_to_change = true
		
	if ready_to_change:
		time_elapsed += 1
		if time_elapsed >= 100:
			get_tree().change_scene(next_level)
#	pass
