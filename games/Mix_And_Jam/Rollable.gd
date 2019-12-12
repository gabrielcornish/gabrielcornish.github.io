extends Area2D
var is_sticking = false
var body_on_which_sticked
var tr_ci_collider_to_ball = Transform2D()
export var collect_level = 1
var collect_anim = load("res://CollectedAnim.tscn")
var speed = 10
var picked_up_sound = load("res://Pickup.tscn")
var pickup_explosion = load("res://ExplosionSound.tscn")



func _ready():
	var load_pickup_sound = picked_up_sound.instance()
	add_child(load_pickup_sound)
	
	var load_explosion = pickup_explosion.instance()
	add_child(load_explosion)
	
	if randi() % 2 > 0:
		speed *= -1
	if get_node("AnimationPlayer") != null:
		get_node("AnimationPlayer").play("idle")
		
		
func _process(delta):
	if not is_sticking:
		if position.x >= 1280:
			speed *= -1
		if position.x <= -100:
			speed *= -1
		position.x += speed * delta
		
		if speed < 0:
			get_node("CollisionShape2D/Sprite").flip_h = true
		else:
			get_node("CollisionShape2D/Sprite").flip_h = false
		pass

func _physics_process(delta):
	
	if is_sticking :
		get_node("Bobbing").stop()
		global_transform = body_on_which_sticked.get_global_transform() * tr_ci_collider_to_ball

func _on_Rollable_area_entered(area):
	if not is_sticking:
		if area.get_parent().get_parent().name == "Player":
			if area.get_parent().get_parent().level == collect_level:
				var trigger_collect_anim = collect_anim.instance()
				add_child(trigger_collect_anim)
				Game.num_collected += 1
				Game.needs_shake = true
				
				stick(area)
				pass
			else:
				return
				
		elif area.get_parent().get_parent().name != "Player" and area.get_parent().get_parent().name != "Exit":
			if area.collect_level >= collect_level and area.is_sticking:
				# print(area.is_sticking)
				Game.num_collected += 1
				stick(area)
				pass
			else:
				return
				
		
		
func stick(area):
	is_sticking = true
	get_node("Pickup").playing = true
	get_node("ExplosionSound").playing = true
	body_on_which_sticked = area
	var tr_ci_world_to_ball = get_global_transform()
	var tr_ci_world_to_collider = body_on_which_sticked.get_global_transform()
	tr_ci_collider_to_ball = tr_ci_world_to_collider.inverse() * tr_ci_world_to_ball
