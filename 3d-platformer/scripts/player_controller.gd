extends CharacterBody3D

#This number is units per second eventually
@export var move_speed : float = 3.0
@export var jump_force : float = 8.0
@export var gravity : float = 20.0

@onready var camera : Camera3D = $Camera3D

func _physics_process(delta: float) -> void:
	#gravity
	velocity.y -= gravity * delta
	
	#jump
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	
	#movement
	var move_input : Vector2 = Input.get_vector("move_right", "move_left", "move_backward", "move_forward")
	var move_direction : Vector3 = Vector3(move_input.x, 0, move_input.y)
	velocity.x = -move_direction.x * move_speed
	velocity.z = -move_direction.z * move_speed
	
	#quick reset if fallen off platform
	if position.y <= -2:
		call_deferred("reload_scene")
	
	move_and_slide()


func reload_scene():
	get_tree().reload_current_scene()
