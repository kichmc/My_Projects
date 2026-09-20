extends CharacterBody2D
const SPEED = 250.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	global_position.x -= SPEED * delta
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
