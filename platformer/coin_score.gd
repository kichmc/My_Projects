extends Control
var coin =  0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_soul_collected(area) -> void:
	coin += 1
	$"CanvasLayer/coin score".text = str(coin)
