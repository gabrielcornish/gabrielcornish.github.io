extends KinematicBody

const MOVE_SPEED = 3
onready var anim_player = $AnimationPlayer
onready var raycast = $RayCast

var player = null
var dead = false

func _ready():
	anim_player.play("walk")
	add_to_group("zombies")
	
	
func _physics_process(delta):
	if dead:
		return
	if player == null:
		return
	var vector_to_player = player.translation - translation
	vector_to_player = vector_to_player.normalized()
	
	raycast.cast_to = vector_to_player * 1.5
	vector_to_player.y = 0
	move_and_collide(vector_to_player * MOVE_SPEED * delta)
	
	if raycast.is_colliding():
		var coll = raycast.get_collider()
		if coll != null and coll.name == "Player":
			print(str(translation.y))
			coll.kill()
	
func set_player(p):
	player = p
	
func kill():
	print(str(translation.y))
	dead = true
	$CollisionShape.disabled = true
	anim_player.play("die")