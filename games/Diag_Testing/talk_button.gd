extends Button

export var talk_to = ""

func _ready():
	connect("pressed", self, "on_pressed")

func on_pressed():
	get_node("../../main").get_node(talk_to).talk()

