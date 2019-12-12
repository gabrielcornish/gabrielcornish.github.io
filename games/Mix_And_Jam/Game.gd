extends Node
var num_collected = 0
var first_collect = false
var all_collected = false
var needs_shake = false

var game_over_door = false
var triggered = false

var music = load("res://MainMusic.tscn")

func _ready():
	var load_music = music.instance()
	add_child(load_music)
	get_node("MainMusic").playing = true
	
func _process(delta):
	if num_collected == 1 and not first_collect:
		first_collect = true
		get_tree().get_current_scene().get_node("Diag/RichTextLabel").update_text("GOTTA ROLL UP ALL THESE GOONS IF I WANT TO BREAKOUT! SMALL ONES FIRST!")
		
	if num_collected >= 14 and not all_collected:
		all_collected = true
		get_tree().get_current_scene().get_node("Diag/RichTextLabel").update_text("TIME TO ROLL UP OUT OF HERE! LET'S HEAD FOR THE DOOR!")
		
	if game_over_door and not triggered:
		triggered = true
		needs_shake = true
		
func _input(event):
	if event.is_action_pressed("escape"):
		get_tree().quit()