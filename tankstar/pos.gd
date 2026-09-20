extends Node
var map

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	map = get_tree().current_scene.get_node("Map/Area2D/CollisionPolygon2D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func target():
	var x = randi_range(-2500,4500)
	var y = randi_range(-1500,3500)
	return Vector2(x,y)
func targetcrt(pos):
	var island_pos =map.to_local(pos)
	if Geometry2D.is_point_in_polygon(island_pos,map.polygon):
			return pos
	else:
		return null
func addtarget():
	while true:
		var poos = target()
		var is_valid = targetcrt(poos)
		if is_valid != null:
			return poos
