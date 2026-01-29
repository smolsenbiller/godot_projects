extends Node2D

@onready var pipe_node : Node2D = $pipes
var game_over = false

var pipes_scene : PackedScene = preload("res://scenes/pipes.tscn")
# Called when the node enters the scene tree for the first time.

#space pipes 225 pixels apart

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#while game_over == false:
		#_on_pipes_add_pipes()
		#await get_tree().create_timer(5.0).timeout


#func _on_pipes_add_pipes() -> void:
	#var pipes = pipes_scene.instantiate()
	#add_child(pipes)
	#pipes.position.x = 1180
	#pipes.position.y = randf_range(-215.0, 185.0)


func _on_timer_timeout() -> void:
	var pipes = pipes_scene.instantiate()
	add_child(pipes)
	pipes.position.x = 1180
	pipes.position.y = randf_range(-215.0, 185.0)
