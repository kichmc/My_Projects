extends CharacterBody2D
signal spawn 
signal collected
var health = 4
var max_health = 4
var dir = false
const SPEED = 100.0
const JUMP_VELOCITY = -180
var double_jump = true
signal died
func _ready() -> void:
	$ProgressBar.max_value = 4
	$ProgressBar.value = 4
	$body.play("idle")
func _physics_process(delta: float) -> void:
	animation()
	jump_physics(delta)
	progressbar_thing()
	if health == 0 or health <= 0:
		die() 
	$ProgressBar.max_value = max_health
	$ProgressBar.value = health
func jump_physics(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("JUMP"):
		if double_jump or is_on_floor():
			velocity.y= JUMP_VELOCITY
			double_jump = false
	if is_on_floor():
		double_jump =true
	if is_on_wall():
		if Input.is_action_pressed("JUMP"):#   or Input.is_action_pressed("a") or Input.is_action_pressed("d"):
			velocity.y = JUMP_VELOCITY

	# Handle jump.
func animation():
	var direction := Input.get_axis("a", "d")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	if direction == 1 :
		$body.flip_h = false
		$body.play("right")
		dir = true
	elif direction == -1 :
		$body.flip_h = true
		$body.play("right")
		dir = false
	else:
		if Input.is_action_just_released("d"):
				$body.flip_h=  false
				$body.play("idle")
				dir = true
		elif Input.is_action_just_released("a"):
				$body.flip_h = true
				$body.play("idle")
				dir = false
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Collectibles"):
		collected.emit(area)
	if area.is_in_group("RESPAWN"):
		spawn.emit(area)
		health =  4

func die():
	died.emit()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		health -= 0.5
		$body.self_modulate = "ff0000"
		if $body.flip_h:
			velocity.x += 750
			position.y -= 25
		if not $body.flip_h:
			velocity.x -= 750 
			position.y -= 25
	if body.is_in_group("Instant_death"):
		die()
	if body.is_in_group("travel"):
		get_tree().change_scene_to_file("res://level_2.tscn")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		$body.self_modulate = "ffffff"
func progressbar_thing():
	var style = $ProgressBar.get_theme_stylebox("fill") as StyleBoxFlat
	style.set_corner_radius_all(15)
	if health >= 2.5:
		style.bg_color = Color.GREEN
