extends CanvasLayer

@onready var health_container : HBoxContainer = $HBoxContainer
var hearts : Array = []

@onready var score_text : Label = $ScoreText

func _ready() -> void:
	var player = get_parent()
	
	player.OnTakeDamage.connect(_update_hearts)
	player.OnUpdateScore.connect(_update_score_text)
	
	_update_score_text(PlayerStats.score)

func _update_hearts(health : int):
	pass
	

func _update_score_text(score: int):
	score_text.text = "Score: " + str(score)
