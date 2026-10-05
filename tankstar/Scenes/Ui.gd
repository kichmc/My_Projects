extends Control
@onready var Hp = $CanvasLayer/ProgressBar
var health = 200
func _ready() -> void:
  Hp.max_value = health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass
  
