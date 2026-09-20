extends Control

func  _ready() -> void:
	$AudioStreamPlayer2D.play()
func _on_button_pressed() -> void:
	$AudioStreamPlayer2D.stream_paused = true
	get_tree().change_scene_to_file("res://main.tscn")


func _on_button_2_pressed() -> void:
	get_tree().quit()
