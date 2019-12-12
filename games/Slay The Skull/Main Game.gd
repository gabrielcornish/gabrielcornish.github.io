extends Node2D

var is_lost = false
var door_opened = false

var open_door = load("res://Door/Door.tscn")
var skull = load("res://Skull/Skull.tscn")
var sword = load("res://Sword/Sword.tscn")
var win = load("res://Win Lose/You Won.tscn")
var lose = load("res://Win Lose/YouLost.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_key_pressed(KEY_R):
		if is_lost:
			get_tree().reload_current_scene()
	
func _build_the_door():
	var created_door = open_door.instance()
	created_door.get_node("Area2D/AnimatedSprite").animation = "open"
	created_door.position = Vector2(500,100)
	add_child(created_door)
	
func _spawn_skull():
	var created_skull = skull.instance()
	add_child(created_skull)

func _spawn_sword():
	var created_sword = sword.instance()
	add_child(created_sword)
	
func _spawn_win():
	var created_win = win.instance()
	add_child(created_win)
	
func _spawn_lose():
	is_lost = true
	var created_lose = lose.instance()
	add_child(created_lose)