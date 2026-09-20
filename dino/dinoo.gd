extends CharacterBody2D

signal toucheddd
const SPEED = 300.0
const JUMP_VELOCITY = -750.0

var jump = false
func _process(delta: float) -> void:
	$AnimatedSprite2D.play("default")
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if jump and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump = false


	move_and_slide()


func _on_node_2d_touch() -> void:
	jump = true


func _on_timer_timeout() -> void:
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		print("faa")
		emit_signal("toucheddd")
