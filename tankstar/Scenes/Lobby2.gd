extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  $CanvasLayer/LineEdit.text = str(Lan_MultiPlayer.my_ip)


  




func _on_host_button_pressed() -> void:
  Lan_MultiPlayer.host()
  get_tree().change_scene_to_file("res://Scenes/Main_online.tscn")
  


func _on_join_button_pressed() -> void:
  Lan_MultiPlayer.join()
  get_tree().change_scene_to_file("res://Scenes/Main_online.tscn")
