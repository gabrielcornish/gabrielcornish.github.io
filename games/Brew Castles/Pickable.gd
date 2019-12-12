extends Sprite
var mouse_is_hovering = false
var being_dragged = false
var grabbed_offset = Vector2()
var has_been_grabbed = false
var particles = load("res://PickParticles.tscn")

func _ready():
	randomize()
	frame = randi() % 8
	
func _process(delta):
	if being_dragged:	
		position = get_global_mouse_position() + grabbed_offset

func _input(event):
	if mouse_is_hovering and event.is_action_pressed("click"):
		
		#if not has_been_grabbed:
		create_pick_particle()
			#has_been_grabbed = true
			
		grabbed_offset = position - get_global_mouse_position()
		being_dragged = true
	
	if event.is_action_released("click"):

		being_dragged = false


func _on_Area2D_mouse_entered():
	mouse_is_hovering = true


func _on_Area2D_mouse_exited():
	mouse_is_hovering = false

func delete_self():
	queue_free()
	
func create_pick_particle():
	get_node("PickAudio").playing = true
	get_tree().call_group("game","create_pick_particles",get_global_mouse_position())

