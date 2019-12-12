extends Area2D
var locked_in = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if locked_in:
		get_parent().get_node("AnimatedSprite").animation = "locked_in_horizontal"
	pass


func _on_EndGoalTrigger_area_entered(area):
	if area.name == "GoalTrigger" or area.name == "GoalTriggerVert":
		
		if area.name == "GoalTriggerVert" and not area.get_owner().horizontal and not get_owner().is_horizontal:
			get_owner().get_owner().current_score += 1
			area.get_owner().goal_reached = true
			get_owner().get_node("AnimatedSprite").animation = "locked_in_vertical"
			
		if area.name == "GoalTrigger" and area.get_owner().horizontal and get_owner().is_horizontal:
			get_owner().get_owner().current_score += 1
			area.get_owner().goal_reached = true
			get_owner().get_node("AnimatedSprite").animation = "locked_in_horizontal"
		print(area.get_owner().name)
	pass # Replace with function body.
