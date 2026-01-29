extends Node2D
@export var pipe_speed : int = 150
@onready var main : Node2D = $".."

var high_position : int = -215
var low_position : int = 185

signal add_pipes()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x -= pipe_speed * delta
	if global_position.x <= 955:
		pass

func detect_position():
	pass

func _on_top_pipe_body_entered(body: Node2D) -> void:
	if not body.is_in_group("bird"):
		return
	
	print("Dead")

func _on_bottom_pipe_body_entered(body: Node2D) -> void:
	if not body.is_in_group("bird"):
		return
	
	print("Dead")  
