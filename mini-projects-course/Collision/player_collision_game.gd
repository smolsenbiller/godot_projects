extends RigidBody3D
@onready var timer = $Timer
@export var move_speed : float = 2.0

func _physics_process(delta: float):
	if Input.is_physical_key_pressed(KEY_LEFT):
		apply_force(Vector3.LEFT * move_speed)
	if Input.is_physical_key_pressed(KEY_RIGHT):
		apply_force(Vector3.RIGHT * move_speed)
	

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Tree"):
		print("restart")
		timer.start()
		

func _on_timer_timeout():
	get_tree().reload_current_scene()
