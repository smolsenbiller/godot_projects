extends CharacterBody3D


const SPEED = 5.0

@onready var camera : Camera3D = $Camera3D
@onready var capsule : MeshInstance3D = $Capsule

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	#Get mouse location to look at it
	var mouse_location = get_viewport().get_mouse_position()
	capsule.look_at(Vector3(mouse_location.x-576, 1, mouse_location.y-324))
	velocity.x = get_input().x * SPEED
	velocity.z = get_input().y * SPEED
	
	move_and_slide()

func get_input():
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward","move_backward")
	return input_dir
