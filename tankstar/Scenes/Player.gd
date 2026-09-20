extends CharacterBody2D
var lstdir
var direction
var rot 
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")


	if direction:
		velocity = direction * SPEED
		lstdir = direction
		rot = direction.angle() + deg_to_rad(-90)
		rotation = rot
	else:
		velocity = Vector2.ZERO
	move_and_slide()
