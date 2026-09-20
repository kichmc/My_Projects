extends Node2D
signal touch
@onready var enemy = preload("res://catcus.tscn")

@onready var label = $"Node/Game over"

var reload = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		touch.emit()


func _on_character_body_2d_2_toucheddd() -> void:
	label.show()
	get_tree().paused = true


func _on_timer_timeout() -> void:
	var pos = Vector2(randi_range(900,1100),460)
	var ene = enemy.instantiate()
	add_child(ene)
	ene.global_position = pos
	
