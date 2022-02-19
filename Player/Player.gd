extends KinematicBody2D

var velocity = Vector2.ZERO

export var FRICTION = 500
export var ACCELERATION = 500
export var ROLL_SPEED = 100
export var MAX_SPEED = 80

enum{
	MOVE,
	ROLL,
	ATTACK
}

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")	
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move_and_collide(velocity)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
