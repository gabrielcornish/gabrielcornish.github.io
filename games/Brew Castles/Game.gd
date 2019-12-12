extends Node2D
var bubbles = load("res://Bubbles.tscn")
var particles = load("res://Particles.tscn")
var alt_particles = load("res://PickParticles.tscn")
var score = 0
var time = 0


func _process(delta):
	if score >= 4:
		get_node("GameTime/GameTimer").game_over = true
		time += 1
		
	if time >= 240:
		get_tree().reload_current_scene()


func _input(event):
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()

func create_bubbles():
	create_enter_particles(get_node("Cauldron").position)

	for i in 10:
		randomize()
		var spawn_bubble = bubbles.instance()
		spawn_bubble.position = get_node("Cauldron").position + Vector2(rand_range(-16,16), -16)
		add_child(spawn_bubble)

func create_pick_particles(pos):
	var create_particles = alt_particles.instance()
	create_particles.position = pos
	add_child(create_particles)
	
func create_enter_particles(pos):
	var spaw_particles = particles.instance()
	spaw_particles.position = pos
	add_child(spaw_particles)
	
func update_score():
	score += 1