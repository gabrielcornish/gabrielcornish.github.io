extends RigidBody2D

var is_sticking = false

# rigid body on which the ball will stick
var body_on_which_sticked

# (used when sticked) Transform (tr) at the collision instant (ci) from the collider to the ball
var tr_ci_collider_to_ball = Transform2D()

func _ready():
	# Enable the logging of 5 collisions.
	set_contact_monitor(true)
	set_max_contacts_reported(5)
	
	# Apply Godot physics at first
	set_use_custom_integrator(false) 

func _physics_process(delta):
	
	if is_sticking :
#	    # We take the last transform of the moving collider, and we keep the same relative position of the ball to the collider it had at the collision instant.
#	    # In other words: "world->collider (at latest news), and then, collider->ball (like at the collision instant)".
		global_transform = body_on_which_sticked.get_global_transform() * tr_ci_collider_to_ball
		# get_node("CollectableCollision").disabled = true
		#if get_node("CollectableCollision").disabled == true:
			#get_node("CollectableCollision").disabled = false
		
	pass

#func _integrate_forces( body_state ):
#
#	# We turn on the "sticking mode" as soon as the ball collides
#	if is_sticking == false && body_state.get_contact_count() >= 1:
#
#		if body_state.get_contact_collider_object(0).name != "Floor":
#			print(body_state.get_contact_collider_object(0).name)
#			is_sticking = true
#
#		# Ignore Godot physics once the ball sticks
#			set_use_custom_integrator(true) 
#
#		# Get the rigid body on which the ball will stick
#
#			body_on_which_sticked = body_state.get_contact_collider_object(0)
#
#        # For debug, check on which we are sticking
#       # print("The ball is sticking on a ", body_on_which_sticked.get_name())
#
#        # Some transforms (tr) at the collision instant (ci)
#			var tr_ci_world_to_ball = get_global_transform() # from the world coordinate system to the ball coordinate system
#			var tr_ci_world_to_collider = body_on_which_sticked.get_global_transform() # from the world cs to the collider cs
#			tr_ci_collider_to_ball = tr_ci_world_to_collider.inverse() * tr_ci_world_to_ball # Because: collider->ball = collider->world then world->ball = inverse(world->collider) then world->ball
#
#
#	# Behavior when sticking
#	if is_sticking :
##	    # We take the last transform of the moving collider, and we keep the same relative position of the ball to the collider it had at the collision instant.
##	    # In other words: "world->collider (at latest news), and then, collider->ball (like at the collision instant)".
#		global_transform = body_on_which_sticked.get_global_transform() * tr_ci_collider_to_ball


func _on_Collectable_body_entered(body):
	if body.name != "Floor" && is_sticking == false:
		if body.name == "Player":
			body.scale_up()
		# get_node("CollectableCollision").disabled = true
		$Timer.start(2)
		is_sticking = true
		set_use_custom_integrator(true)
		body_on_which_sticked = body
		var tr_ci_world_to_ball = get_global_transform()
		var tr_ci_world_to_collider = body_on_which_sticked.get_global_transform()
		tr_ci_collider_to_ball = tr_ci_world_to_collider.inverse() * tr_ci_world_to_ball
	pass # Replace with function body.


func _on_Timer_timeout():
	get_node("CollectableCollision").disabled = false
	pass # Replace with function body.
