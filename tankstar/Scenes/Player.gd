extends CharacterBody2D
var lstdir
var direction
var dir
var rot 
var can_shot = true
@onready var bullets = preload("res://Bullet.tscn")

@onready var barrel = $Barrel
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
func  _ready() -> void:
  if !is_multiplayer_authority():
    return
  $Camera2D.make_current()
func _physics_process(delta: float) -> void:
  if !is_multiplayer_authority():return
  direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
  if Input.is_action_pressed("Shoot") and can_shot:
    shoot()

  if direction:
    velocity = direction * SPEED
    lstdir = direction
    rot = direction.angle() + deg_to_rad(-90)
    rotation = rot
  else:
    velocity = Vector2.ZERO
  move_and_slide()
func shoot():
   can_shot = false
   var bulletss = bullets.instantiate()
   bulletss.global_position = $".".global_position
   bulletss.direction = $".".direction
   add_child(bulletss)
   await get_tree().create_timer(.5).timeout
   can_shot = true
  
