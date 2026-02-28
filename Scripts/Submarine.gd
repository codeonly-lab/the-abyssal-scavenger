extends CharacterBody2D

var speed = 200
var sonar_scene = preload("res://Scenes/SonarPulse.tscn")  # preload sonar

func _physics_process(delta):
	var input_vector = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1

	input_vector = input_vector.normalized() * speed
	
	# Update the CharacterBody2D velocity
	velocity = input_vector

	# Move the submarine
	move_and_slide()

# This function handles input for firing sonar
func _input(event):
	if event.is_action_pressed("sonar"):  # make sure "sonar" is mapped in Input Map
		var pulse = sonar_scene.instantiate()   # create a new pulse
		pulse.position = global_position        # spawn at submarine position
		get_parent().add_child(pulse)           # add it to the scene tree
		pulse.activate()                         # start expansion
