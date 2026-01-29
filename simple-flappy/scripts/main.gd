extends Node2D

var pipes_scene : PackedScene = preload("res://scenes/pipes.tscn")
var game_start = false
var game_over = false
var score = 0
@onready var timer : Timer = $Timer
@onready var score_label : Label = $CanvasLayer/score_label
@onready var start_info : Label = $CanvasLayer/start_info

func _ready() -> void:
	start_info.text = "Press 'space' to start"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_start == false and Input.is_action_just_pressed("ui_accept"):
		game_start = true
		timer.start()
		start_info.hide()
	
	score_label.text = "Score: " + str(score)
	
	if game_start == true and game_over == true:
		if score >= HighScore.high_score:
			HighScore.high_score = score
		
		start_info.text = "High Score: " + str(HighScore.high_score) + "\nYour Score: " + str(score) + "\nPress space to restart"
		start_info.show()
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().reload_current_scene()

func _on_timer_timeout() -> void:
	var pipes = pipes_scene.instantiate()
	add_child(pipes)
	pipes.position.x = 1180
	pipes.position.y = randf_range(-215.0, 185.0)
