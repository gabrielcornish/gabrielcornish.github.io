extends Sprite
var mouse_is_hovering = false
var being_dragged = false
var grabbed_offset = Vector2()
var originX
var originY
var radius = 15
var angle = 0
var speed = 3
var activated = false

func _ready():
	speed = randi() % 3 + 2
	originX = position.x
	originY = position.y
	randomize()
	frame = randi() % 7
	
func _process(delta):
	angle += speed * delta
	if angle > 360:
		angle = 0
	if not being_dragged:
		position.x = (originX + cos(angle)*radius)
		position.y = (originY + sin(angle)*radius)
		
	if being_dragged:	
		position = get_global_mouse_position() + grabbed_offset

func _input(event):
	if mouse_is_hovering and event.is_action_pressed("click"):
		grabbed_offset = position - get_global_mouse_position()
		scale = Vector2(1,1)
		being_dragged = true
	
	if event.is_action_released("click"):
		scale = Vector2(2,2)
		being_dragged = false

func _on_Area2D_mouse_entered():
	mouse_is_hovering = true


func _on_Area2D_mouse_exited():
	mouse_is_hovering = false


func _on_Area2D_area_entered(area):
	if area.get_parent().name == "Cauldron":
		if activated:
			get_node("AudioStreamPlayer").playing = true
			get_tree().call_group("camera","trigger_camera_shake", 0.3)
			get_tree().call_group("game","create_bubbles")
			get_tree().call_group("game","update_score")
			visible = false
		else:
			get_node("wrong").playing = true
			being_dragged = false
	
	if area.get_parent().is_in_group("pickable"):
		if not activated:
			get_node("ActivatedSound").playing = true
			for i in 4:
				randomize()
				get_tree().call_group("game","create_pick_particles",position+Vector2(randi()%10,randi()%10))
			activated = true
			get_tree().call_group("camera","trigger_camera_shake", 0.3)
			area.get_parent().queue_free()

func _on_AudioStreamPlayer_finished():
	queue_free()
	pass # Replace with function body.
