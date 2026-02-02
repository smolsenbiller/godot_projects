extends CharacterBody2D

@onready var pivot: Node2D = $Pivot_Anchor
@onready var gun: AnimatedSprite2D = $Pivot_Anchor/AnimatedSprite2D

var bullet_path = preload("res://scenes/bullet.tscn")

func _physics_process(delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	pivot.look_at(mouse_position)
	if Input.is_action_just_pressed("left_click"):
		fire()
	

	move_and_slide()
func fire():
	var bullet = bullet_path.instantiate()
	bullet.gun_direction = pivot.rotation
	bullet.gun_position = gun.global_position
	bullet.gun_rotation = pivot.rotation
	get_parent().add_child(bullet)
	
#func _process(delta: float) -> void:
	#print(pivot.get_axis())
