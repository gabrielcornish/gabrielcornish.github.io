extends AnimatedSprite

var speed = 20
var dir = "right"
var is_moving = false
var is_carrying_empty_water = false
var is_holding_water = false
var current_water_id = null

# Movement code and direction
func _process(delta):
	if is_moving:
		if dir == "right" and position.x < 252:
			flip_h = false
			position.x += speed * delta
		elif dir == "left" and position.x > 4:
			flip_h = true
			position.x -= speed * delta

# Movement Input code
func _input(event):
	if event.is_action_pressed("click"):
		is_moving = true
		if get_global_mouse_position().x >= position.x:
			move_direction("right")
		else:
			move_direction("left")
			
	if event.is_action_released("click"):
		is_moving = false

func move_direction(direct):
	dir = direct
	pass

func _on_Area2D_area_entered(area):
	# if player is carrying an empty canister and touches a bucket holder
	if area.get_parent().name == "Water Bucket Holder" and is_carrying_empty_water:
		
		#make sure we have the reference to thing we're carrying
		if current_water_id != null:
			# if the bucket holder is available
			if not area.get_parent().occupied:
				area.get_parent().occupied = true
				is_carrying_empty_water = false
				is_holding_water = false
				
				current_water_id.bucket_id = area.get_parent().get_path()
				
				current_water_id.reset_self(area.get_parent().holder_position)
				current_water_id = null
