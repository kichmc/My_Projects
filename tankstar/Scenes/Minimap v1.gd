extends SubViewport

@onready var Players = $"../../.."
@onready var camera = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  world_2d = get_tree().root.world_2d
  if Players.is_multiplayer_authority():
    return
  else:
    print("ihave")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  if is_multiplayer_authority():
    camera.position = Players.position
