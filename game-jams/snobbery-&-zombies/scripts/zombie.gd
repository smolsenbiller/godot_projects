extends CharacterBody2D
class_name Zombie

@onready var player: CharacterBody2D = %Player
@onready var nav_agent: NavigationAgent2D = %NavigationAgent2D

var speed: float = 20.0
var target_position: Vector2

func _ready() -> void:
	nav_agent.path_desired_distance = 1.0
	nav_agent.target_desired_distance = 1.0
	
	actor_setup.call_deferred()

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	set_movement_target(target_position)

func set_movement_target(movement_target: Vector2):
	nav_agent.target_position = movement_target

func _process(delta: float) -> void:
	target_position = player.position
	set_movement_target(target_position)

func _physics_process(delta):
	if nav_agent.is_navigation_finished():
		return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = nav_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * speed
	move_and_slide()


func hit():
	queue_free()
