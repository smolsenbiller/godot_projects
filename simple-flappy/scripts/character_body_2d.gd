extends CharacterBody2D

@onready var main : Node2D = $".."

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if main.game_start == true:
		if main.game_over == false:
			# Add the gravity.
			if not is_on_floor():
				velocity += get_gravity() * delta
				# Handle jump.
			if Input.is_action_just_pressed("ui_accept"):
				velocity.y = JUMP_VELOCITY
		else:
			velocity.y = 0
	
	if global_position.y >= 615:
		main.game_over = true
	
	if global_position.y <= 25:
		main.game_over = true

	move_and_slide()
