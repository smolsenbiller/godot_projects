extends Node2D

var pipes_scene : PackedScene = preload("res://scenes/pipes.tscn")

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	var pipes = pipes_scene.instantiate()
	add_child(pipes)
	pipes.position.x = 1180
	pipes.position.y = randf_range(-215.0, 185.0)
