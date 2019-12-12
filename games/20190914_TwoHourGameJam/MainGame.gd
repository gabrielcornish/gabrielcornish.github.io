extends Node2D

var is_game_won = false
var is_game_lost = false

onready var circle_rune_one = $CircleRuneOne/Area2D
onready var square_rune_one = $SquareRuneOne/Area2D
onready var square_rune_two = $SquareRuneTwo/Area2D
onready var you_win = $YouWin
onready var you_lost = $YouLost

var replay_button = load("res://Replay Button.tscn")

func _ready():
	you_win.visible = false
	you_lost.visible = false
	set_process(true)



func _process(delta):
	if circle_rune_one.was_clicked == true:
		if square_rune_one.was_clicked == true:
			if square_rune_two.was_clicked == false:
				if is_game_won == false:
					is_game_won = true
					you_win.visible = true
					disable_clicks()
					create_replay_button()
					print("game is won!")
					
	if circle_rune_one.was_clicked == false:
		if square_rune_one.was_clicked == true:
			if square_rune_two.was_clicked == true:
				if is_game_won == false:
					is_game_won = true
					you_win.visible = true
					disable_clicks()
					create_replay_button()
					print("game is won!")
					
	if circle_rune_one.was_clicked == true:
		if square_rune_two.was_clicked == true:
			if is_game_lost == false:
				is_game_lost = true
				you_lost.visible = true
				disable_clicks()
				create_replay_button()
				print("game is LOST!")
					
func disable_clicks():
	circle_rune_one.can_be_clicked = false
	square_rune_one.can_be_clicked = false
	square_rune_two.can_be_clicked = false
	
	
func create_replay_button():
	var node = replay_button.instance()
	add_child(node)

