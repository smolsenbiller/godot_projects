extends CanvasLayer

@onready var health : HBoxContainer = $HealthContainer
var hearts : Array = []

@onready var coin_score : Label = $Score

@onready var player = get_parent()

func _ready():
	hearts = health.get_children()
	print(hearts)

func _on_player_on_update_health(health: int) -> void:
	hearts[health].hide()

func _on_player_on_update_score(score: int) -> void:
	coin_score.text = "Coins: " + str(score)
