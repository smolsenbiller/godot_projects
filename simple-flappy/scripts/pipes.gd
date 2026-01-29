extends Node2D

@export var pipe_speed : int = 150

@onready var main : Node2D = $".."

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if main.game_start == true:
		if main.game_over == false:
			global_position.x -= pipe_speed * delta
		else:
			pass
	if global_position.x <= -10:
		queue_free()

func _on_top_pipe_body_entered(body: Node2D) -> void:
	if not body.is_in_group("bird"):
		return
	main.game_over = true

func _on_bottom_pipe_body_entered(body: Node2D) -> void:
	if not body.is_in_group("bird"):
		return
	main.game_over = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if not body.is_in_group("bird"):
		return
	main.score += 1
