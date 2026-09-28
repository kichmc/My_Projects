extends Node2D
var shot = true
var shott = true
var shooted = false
@onready var bot = $Bot
@onready var player = $Players/Player
@onready var bullet = preload("res://Bullet.tscn")
var bots = preload("res://Scenes/Bots.tscn")
var bott
func _ready() -> void:
	player.global_position = spwan_pos()
	bot.global_position = spwan_pos()
	bot_spwan()


func Spawn():
	var x = randi_range(-2500,4500)
	var y = randi_range(-1500,3500)
	return Vector2(x,y)


func check_pos(pos):
	var island_pos = $Map/Area2D/CollisionPolygon2D.to_local(pos)
	if Geometry2D.is_point_in_polygon(island_pos,$Map/Area2D/CollisionPolygon2D.polygon):
		return pos
	else:
		return null


func posobj(pos):
	var space= get_world_2d().direct_space_state
	var check = PhysicsPointQueryParameters2D.new()
	var res = space.intersect_point(check)
	check.position = pos


	if res.size() > 0:
		return false
	return true






func shoot():
	shot = false
	var bullets = bullet.instantiate()
	bullets.global_position = $Players/Player/Marker2D.global_position
	bullets.direction = player.lstdir
	add_child(bullets)
	await get_tree().create_timer(.2).timeout
	shot = true

func _process(delta: float) -> void:
	bot.player_pos = player.global_position

	if Input.is_action_pressed("Shoot") and shot:
		shoot()

	if shooted and shott:
		sht()

func sht():
	shott = false
	var bulletss = bullet.instantiate()
	bulletss.global_position = $Bot.global_position
	bulletss.direction = $Bot.direction
	add_child(bulletss)
	await get_tree().create_timer(.5).timeout
	shott = true

func bot_spwan():
	var no_spawn = randi_range(6,15)
	for i in range(no_spawn):
		bott = bots.instantiate()
		bott.global_position = spwan_pos()
		bott.player_pos = player.global_position
		add_child(bott)

func spwan_pos():
	while true:
		var spawn_pos = Spawn()
		var valid_pos = check_pos(spawn_pos)
		var is_in_not = posobj(spawn_pos)
		if valid_pos != null and is_in_not != null:
			return spawn_pos
