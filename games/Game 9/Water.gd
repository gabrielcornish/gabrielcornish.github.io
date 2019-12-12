extends Sprite

var starting_position
var picked_up = false
var ready_to_be_picked_up = true
var water_is_full = true
var human_in_area = false
export (NodePath) var player
export (NodePath) var bucket_id = null

func _ready():
	# get starting position for water
	starting_position = position

func _process(delta):
	check_if_player_has_water()
	
	# if there's a player and self has been picked up, follow the player
	if player != null and picked_up:
		if get_node(player).flip_h:
			position.x = get_node(player).position.x + 4
			position.y = get_node(player).position.y - 2
		else:
			position.x = get_node(player).position.x - 4
			position.y = get_node(player).position.y - 2
			

func check_if_player_has_water():
	if ready_to_be_picked_up and human_in_area:
		if not get_node(player).is_holding_water:
			# I tell the player who I am
			get_node(player).current_water_id = self
			
			# I'm picked up and I know who the player is
			picked_up = true
			ready_to_be_picked_up = false
			get_node("Picked Up Audio").playing = true
			
			# The player is now holding water
			get_node(player).is_holding_water = true
			
			#set bucket holder to not occupied
			if bucket_id != null:
				get_node(bucket_id).occupied = false

func _on_Area2D_area_entered(area):
	# if human touches me and my frame is at 0
	if area.get_parent().name == "Human":
		human_in_area = true
#		if ready_to_be_picked_up:
#			if not get_node(player).is_holding_water:
#				# I tell the player who I am
#				get_node(player).current_water_id = self
#
#				# I'm picked up and I know who the player is
#				picked_up = true
#				ready_to_be_picked_up = false
#				get_node("Picked Up Audio").playing = true
#
#				# The player is now holding water
#				get_node(player).is_holding_water = true
#
#				#set bucket holder to not occupied
#				if bucket_id != null:
#					get_node(bucket_id).occupied = false
				
				
			
	if area.get_parent().name == "Well" or area.get_parent().name == "Well2":
		if water_is_full:
			get_node("Drop Off Audio").playing = true
			water_is_full = false
			get_node(player).is_carrying_empty_water = true
			Game.points += 3
			frame = 1

func reset_self(pos):
	print("RESET TRIGGERED")
	position = pos
	picked_up = false
	get_node("Empty Drop Off").playing = true
	if not water_is_full:
		get_node("RefillTimer").start(5)
		
	get_node(player).is_carrying_empty_water = false

func _on_RefillTimer_timeout():
	print("TIME OUT")
	if frame < 4 and frame != 0:
		frame += 1
		get_node("RefillTimer").start(6)
	else:
		get_node("Ready Particles").visible = true
		get_node("Ready Audio").playing = true
		water_is_full = true
		ready_to_be_picked_up = true
		frame = 0


func _on_Area2D_area_exited(area):
	if area.get_parent().name == "Human":
		human_in_area = false

