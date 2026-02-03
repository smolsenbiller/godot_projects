extends CharacterBody2D

@onready var pivot: Node2D = $Pivot_Anchor
@onready var gun: AnimatedSprite2D = $Pivot_Anchor/AnimatedSprite2D
var speed: float = 40.0

var bullet_path = preload("res://scenes/bullet.tscn")

func get_input():
	var input_direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = input_direction * speed
func _physics_process(delta: float) -> void:
	get_input()
	
	#set up gun rotation
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
