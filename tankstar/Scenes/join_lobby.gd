extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  pass
  #$CanvasLayer/LineEdit.grab_focus()
  #print("LineEdit focused: ", $CanvasLayer/LineEdit.has_focus())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  if Input.is_action_pressed("ui_accept"):
    Lan_MultiPlayer.join()


func _on_back_pressed() -> void:
  get_tree().change_scene_to_file("res://Scenes/Multiplayer.tscn")
