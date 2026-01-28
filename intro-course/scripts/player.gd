extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:
	velocity.y = 0
	velocity.x = 0
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= SPEED
	elif Input.is_action_pressed("ui_down"):
		velocity.y += SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED

	move_and_slide()
