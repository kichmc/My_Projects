extends Label
var score = 0
@onready var labelhighscore = $Highscore
var highscore = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loadscore()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score += delta * 1
	text = str(int(score))
	if score > highscore:
		highscore = score
		labelhighscore.text = str(int(highscore))

func storescore():
	var filecrt = FileAccess.open("user://game.dat",FileAccess.WRITE)
	filecrt.store_var(highscore)
func loadscore():
	if FileAccess.file_exists("user://game.dat"):
		var loadscr = FileAccess.open("user://game.dat",FileAccess.READ)
		highscore= loadscr.get_var()
		labelhighscore.text = str(int(highscore))

func _on_character_body_2d_toucheddd() -> void:
	storescore()
