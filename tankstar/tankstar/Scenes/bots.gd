extends CharacterBody2D
var nav
var main
var target
var direction
var player_pos := Vector2.ZERO
const range = 500
var SPEED = 300.0
@onready var sprite = $Sprite2D

@onready var txtrs = [
preload("res://Pngs/PNG/Default size/tank_bigRed.png"),
preload("res://Pngs/PNG/Default size/tank_blue.png"),
preload("res://Pngs/PNG/Default size/tank_dark.png"),
preload("res://Pngs/PNG/Default size/tank_darkLarge.png")]

func _ready() -> void:
	main = get_tree().current_scene
	nav = $NavigationAgent2D
	target = Pos.addtarget()
	nav.target_position = target
	sprite.texture = txtrs.pick_random()
func _physics_process(delta: float) -> void:
	move()
func move():
	var next_way = nav.get_next_path_position()
	direction = global_position.direction_to(next_way)
	var distance = global_position.distance_to(nav.target_position)
	var dis = global_position.distance_to(player_pos)
	rotation = direction.angle() + deg_to_rad(-90)


	if not nav.target_position == null:
		velocity = direction * SPEED



	if distance < 20:
		target = Pos.addtarget()
		nav.target_position = target
	move_and_slide()
	
	if dis <= range:
		direction = global_position.direction_to(player_pos)
		$RayCast2D.target_position = player_pos
		
		if dis < 300:
			nav.target_position = player_pos
		if dis < 150:
			rotation = direction.angle() + deg_to_rad(-90)
			SPEED = 0
			nav.target_position = global_position
		else:
			SPEED = 300.0
		if not $RayCast2D.is_colliding():
			main.shooted = true



	
