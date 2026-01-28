extends Area3D

@export var clicks_to_pop : int = 5
@export var size_increase : float = 0.2
@export var score_to_give : int = 1
var clicks : int = 0
var manager

func _ready():
	manager = $".."

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is not InputEventMouseButton:
		return
	
	if event.button_index != MOUSE_BUTTON_LEFT:
		return
	
	if not event.pressed:
		return
	
	scale += Vector3(size_increase, size_increase, size_increase)
	clicks += 1
	if clicks == clicks_to_pop:
		manager.increase_score(score_to_give)
		queue_free()
		
