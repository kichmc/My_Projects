class_name class_bot
extends CharacterBody2D
var nav
var main
var target
var direction
var target_rot
var player_pos := Vector2.ZERO
const range = 500
var SPEED = 300.0
var rot_speed = 5.0

@onready var sprite = $Sprite2D

@onready var txtrs = [
preload("res://Pngs/PNG/Default size/tank_bigRed.png"),
preload("res://Pngs/PNG/Default size/tank_blue.png"),
preload("res://Pngs/PNG/Default size/tank_dark.png"),
preload("res://Pngs/PNG/Default size/tank_darkLarge.png")]

func _ready() -> void:
  main = get_tree().current_scene
  nav = $NavigationAgent2D
  target = Pos.spawn_pos()
  nav.target_position = target
  sprite.texture = txtrs.pick_random()
func _physics_process(delta: float) -> void:
  move(delta)
func move(delta: float):
  var next_way = nav.get_next_path_position()
  direction = global_position.direction_to(next_way)
  var distance = global_position.distance_to(nav.target_position)
  var dis = global_position.distance_to(player_pos)
  target_rot = direction.angle() + deg_to_rad(270)
  rotation = lerp_angle(rotation,target_rot,rot_speed * delta)

  if not nav.target_position == null:
      velocity = direction * SPEED



  if distance < 20:
    target = Pos.spawn_pos()
    nav.target_position = target
  move_and_slide()
  

  if dis <= range:
    direction = global_position.direction_to(player_pos)
    $RayCast2D.target_position = to_local(player_pos)

  if dis < 300:
      nav.target_position = player_pos
      if dis < 150:
         SPEED = 0
         nav.target_position = global_position
      else:
        SPEED = 300.0
        if not $RayCast2D.is_colliding():
          main.shooted = true



  
