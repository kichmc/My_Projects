extends Node

var spawn = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_soul_spawn(area) -> void:
	spawn = area.global_position
	$RESPAWNPOINT/Sprite2D.play("GREEN")


func _on_player_soul_died() -> void:
	if not spawn == Vector2(0,0):
		$player_soul.global_position = spawn
		
	else:
		get_tree().reload_current_scene()
