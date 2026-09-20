extends CharacterBody2D
const SPEED = 300
var direction
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation = direction.angle() + deg_to_rad(90)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity += direction * SPEED
	
	move_and_slide()


func _on_area_body_entered(body: Node2D) -> void:
	if body.name == "Objects":
		queue_free()
