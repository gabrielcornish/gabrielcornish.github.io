extends Sprite
export var id = 1

func _ready():
	position.x += id*12
	
func _process(delta):
	if id <= game.current_score:
		frame = 1
	else:
		frame = 0