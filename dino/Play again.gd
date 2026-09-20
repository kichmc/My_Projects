extends Node
var play = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Playagain.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		if play == true:
			get_tree().paused = false
			get_tree().reload_current_scene()
			print("boo")






func _on_character_body_2d_toucheddd() -> void:
	get_tree().paused = true
	$Playagain.show()
	$"Game over".show()
	play = true
