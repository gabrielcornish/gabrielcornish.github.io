extends Node

var last_x_scale = 0
var last_y_scale = 0

var current_score = 0

var timer_started = false
var timer_stopped = false
var time = 0


func _process(delta):
	if timer_started and not timer_stopped:
		time += 1
	elif not timer_started and not timer_stopped:
		time = 0

func reset_game():
	timer_started = false
	timer_stopped = false
	current_score = 0
	last_x_scale = 0
