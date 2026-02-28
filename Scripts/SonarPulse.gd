extends Area2D

var max_scale = Vector2(6, 6)
var speed = 3.5
var active = false

func _process(delta):
	if active:
		# Increase scale smoothly
		scale.x += speed * delta
		scale.y += speed * delta
		# Check if we reached max
		if scale.x >= max_scale.x or scale.y >= max_scale.y:
			queue_free()
 
func activate():
	active = true
	scale = Vector2(0.108, 0.1)

var sonar_scene = preload("res://Scenes/SonarPulse.tscn")
