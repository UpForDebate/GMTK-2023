extends CharacterBody3D

@export var speed = 14.0
@export var rotation_speed = 1
@export var jump_impulse = 20.0
@export var fall_acceleration = 75.0

var current_speed = 0.0

func _physics_process(delta):
	
	var direction = (position - $Pivot.global_position)
	
	if Input.is_action_pressed("rotate_right"):
		rotation.y -= rotation_speed * delta
		velocity = Vector3.ZERO
	else: if Input.is_action_pressed("rotate_left"):
		rotation.y += rotation_speed * delta
		velocity = Vector3.ZERO

	else: if Input.is_action_pressed("move_backward"):
		velocity =  direction * speed
	else: if Input.is_action_pressed("move_forward"):
		velocity = -direction * speed
	else:
		velocity = Vector3.ZERO
	

	move_and_slide()


