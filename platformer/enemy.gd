extends CharacterBody2D

var dir = 1
const SPEED = 30.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	$Sprite2D.play("default")
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = dir * SPEED
	if not $RayCast2D.is_colliding():
		$RayCast2D.scale.x *= -1
		dir *= -1

	move_and_slide()
