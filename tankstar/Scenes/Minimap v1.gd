extends SubViewport

@onready var Players = get_tree().current_scene.find_child("Player" , true)
@onready var camera = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	world_2d = get_tree().root.world_2d


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camera.global_position = Players.global_position
