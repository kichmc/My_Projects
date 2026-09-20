extends Node2D


var spawn
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_soul_died() -> void:
	if spawn == null:
		$player_soul.global_position = Vector2(151,131)
	else:
		$player_soul.global_position = spawn

func _on_player_soul_spawn(area) -> void:
		spawn = area.global_position
