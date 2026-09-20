extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = get_tree().current_scene.find_child("player_soul")
	player.collected.connect(_player_collected)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$AnimatedSprite2D.play("default")
	


func _player_collected(hitted:Node):
	$AudioStreamPlayer2D.play()
	if hitted == $Area2D :
		queue_free()
