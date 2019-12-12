extends Camera2D
var new_position = 128
var reset_activated = false
var moving_over = false

func _ready():
	print(str(new_position))

func _process(delta):
		
		
	# print(str(new_position))
	if moving_over:
		if position.x < new_position:
			print(str(new_position)+"|"+str(position.x))
			position.x += 5
			
		if position.x > new_position and not reset_activated:
			position.x = new_position
			get_tree().call_group("circle","turn_off_wait")
			print("WAIT IS OVERS")
			
		if position.x > new_position and reset_activated:
			position.x -= 8
		
		if position.x <= 128 and reset_activated:
			position.x = 128
			get_tree().call_group("circle","reset_self")
			reset_activated = false
			game.reset_game()

func move_over(num):
	moving_over = true
	new_position = num + position.x
	
	

func reset_camera():
	moving_over = true
	reset_activated = true
	new_position = 128