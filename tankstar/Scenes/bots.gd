extends CharacterBody2D
var nav
var target
var player_pos := Vector2.ZERO
const range = 400
const SPEED = 300.0
@onready var sprite = $Sprite2D

@onready var txtrs = [
preload("res://Pngs/PNG/Default size/tank_bigRed.png"),
preload("res://Pngs/PNG/Default size/tank_blue.png"),
preload("res://Pngs/PNG/Default size/tank_dark.png"),
preload("res://Pngs/PNG/Default size/tank_darkLarge.png")]

func _ready() -> void:
	nav = $NavigationAgent2D
	target = Pos.addtarget()
	nav.target_position = target
	sprite.texture = txtrs.pick_random()
func _physics_process(delta: float) -> void:
	move()
func move():
	var next_way = nav.get_next_path_position()
	var direction = global_position.direction_to(next_way)
	var distance = global_position.distance_to(nav.target_position)
	var dis = global_position.distance_to(player_pos)


	rotation = direction.angle() + deg_to_rad(-90)
	if not nav.target_position == null:
		velocity = direction * SPEED


	if distance < 20:
		target = Pos.addtarget()
		nav.target_position = target
	move_and_slide()
	
	if dis < range:
		direction = global_position.direction_to(player_pos)
		var angle = direction.angle()
		rotation = angle + deg_to_rad(90)
		if dis >= 150:
			nav.target_position = player_pos
			$NavigationAgent2D.max_speed = 50
		else:
			nav.target_position = global_position
			velocity = Vector2.ZERO
