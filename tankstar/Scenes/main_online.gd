extends Node2D
@onready var bullets = preload("res://Bullet.tscn")
var can_shot = true
@onready var player = preload("res://Scenes/Player.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
   #Lan_MultiPlayer.joined.connect(
    #_on_player_connected
  #)
   $MultiplayerSpawner.spawn_function = _on_player_connected
   if multiplayer.is_server():
    multiplayer.peer_connected.connect(func(id):
      $MultiplayerSpawner.spawn(id))
    $MultiplayerSpawner.spawn(multiplayer.get_unique_id())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass
func _on_player_connected(id):
  var playerss = player.instantiate()
  playerss.name = str(id)
  playerss.set_multiplayer_authority(id)
  playerss.global_position = spwan_pos()
  print(id)
  print("spawned")
  return playerss

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
   return null
  return pos


func spwan_pos():
 while true:
  var spawn_pos = Spawn()
  var valid_pos = check_pos(spawn_pos)
  var is_in_not = posobj(spawn_pos)
  if valid_pos != null and is_in_not != null:
    return spawn_pos
