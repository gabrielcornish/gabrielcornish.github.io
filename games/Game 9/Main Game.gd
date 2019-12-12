extends Node2D
var game_lost = false
var cleared = false
var timer_count = 0
var wait_sec = 2
var click_parts = load("res://Ready Particles.tscn")
func _ready():
	pass 

func _input(event):
	if cleared and game_lost:
		get_node("LoseText").visible = false
	
	if event.is_action_pressed("click"):
		var click_parts_created = click_parts.instance()
		click_parts_created.position = get_global_mouse_position()
		click_parts_created.to_be_destroyed = true
		add_child(click_parts_created)
		pass
		
	if game_lost:
		if event.is_action_pressed("click") and timer_count > 60 * wait_sec:
			get_tree().change_scene("res://Main Menu/Main Menu.tscn")
			Game.points = 0
			
	if cleared:
		if event.is_action_pressed("click") and timer_count > 60 * wait_sec:
			get_tree().change_scene("res://Main Menu/Main Menu.tscn")
			Game.points = 0

	if Game.game_won and not cleared:
		cleared = true
		get_node("WinText").visible = true
		
		get_node("Container").visible = false
		get_node("Node2D/TimerText/Timer").stop()
		get_node("Node2D").visible = false
		
		get_node("RainParticles").visible = false
		get_node("RainParticles2").visible = false
		get_node("RainParticles3").visible = false
		
func _process(delta):
	if game_lost:
		timer_count += 1
	if cleared:
		timer_count += 1
		
		
func _on_Timer_timeout():
	game_lost = true
	
	if not cleared:
	# Stop rain Particles
		get_node("RainParticles").visible = false
		get_node("RainParticles2").visible = false
		get_node("RainParticles3").visible = false
		
		get_node("Container").visible = false
		
		#Ground transition
		get_node("Floor").visible = false
		get_node("FloorDead").visible = true
		get_node("DeadGround").visible = true
		get_node("FloorDead").playing = true
		
		#Display Lose Text
		get_node("LoseText").visible = true

