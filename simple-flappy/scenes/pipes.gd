extends Node2D

@export var pipe_speed : int = 150

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x -= pipe_speed * delta

func _on_top_pipe_body_entered(body: Node2D) -> void:
	if not body.is_in_group("bird"):
		return
	print("Dead")

func _on_bottom_pipe_body_entered(body: Node2D) -> void:
	if not body.is_in_group("bird"):
		return
	print("Dead")  

func _on_area_2d_body_exited(body: Node2D) -> void:
	if not body.is_in_group("bird"):
		return
	print("score")
