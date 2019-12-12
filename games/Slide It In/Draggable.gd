extends Area2D
var goal_reached = false
var can_be_dragged = true
var is_dragging = false
var hovered = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if goal_reached:
		can_be_dragged = false
		is_dragging = false
		
	_movement()
	
#	pass
func _input(event):
	if event.is_action_pressed("left_mouse_button") and can_be_dragged and hovered:
		is_dragging = true
		get_node("pickup").pitch_scale = randi() % 15
		get_node("pickup").playing = true
	if event.is_action_released("left_mouse_button"):
		get_node("dropped").pitch_scale = randi() % 15
		get_node("dropped").playing = true
		is_dragging = false

func _on_Draggable_mouse_entered():
	hovered = true
	pass # Replace with function body.


func _on_Draggable_mouse_exited():
	hovered = false
	pass # Replace with function body.
	
func _movement():
	
	if is_dragging:
		if get_owner().horizontal:
			get_node("PlayerAnimatedSprite").scale = Vector2(0.75,0.75)
			get_node("DirectionalAnimatedSprite").visible = true
			get_parent().position.x = get_global_mouse_position().x
			
		if not get_owner().horizontal:
			get_node("PlayerAnimatedSprite").scale = Vector2(0.75,0.75)
			get_node("DirectionalAnimatedSprite").visible = true
			get_parent().position.y = get_global_mouse_position().y
		
	if not is_dragging:
		get_node("DirectionalAnimatedSprite").visible = false
		get_node("PlayerAnimatedSprite").scale = Vector2(1,1)
