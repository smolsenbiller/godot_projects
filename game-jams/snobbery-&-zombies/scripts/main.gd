extends Node2D

#preloading the zombie scene because eventually I will be spawning a lot of zombies

@onready var zombie_scene : PackedScene

#Get spawn point. Using a sprite as a refernce
@onready var spawn_point : Sprite2D = $SpawnTopLeft

func _ready() -> void:
	await get_tree().physics_frame
	zombie_scene = load("res://scenes/zombie.tscn")
	#Instantiating the zombie scene and putting it into a vaiable
	var new_zombie = zombie_scene.instantiate()
	#Adding a position to the zombie variable
	new_zombie.position = spawn_point.position
	#Adding the zombie to the main scene
	add_child(new_zombie)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
