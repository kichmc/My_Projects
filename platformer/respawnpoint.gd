extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.play("RED")

func _process(delta: float) -> void:
	pass






func _on_area_2d_area_entered(area: Area2D) -> void:
	$Sprite2D.play("GREEN")
