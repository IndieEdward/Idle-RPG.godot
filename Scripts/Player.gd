extends KinematicBody2D

const max_speed = 100

var velocity = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector
		velocity = velocity.clamped(max_speed * delta)
	else:
		velocity = Vector2.ZERO
	
	move_and_collide(velocity)
