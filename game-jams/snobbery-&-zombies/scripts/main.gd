extends Node2D

#preloading the zombie scene because eventually I will be spawning a lot of zombies
const zombie_scene = preload("res://scenes/zombie.tscn")

#Get spawn point. Using a sprite as a refernce
@onready var spawn_point : Sprite2D = $SpawnTopLeft
@onready var round_count : Label = $Player/Camera2D/CanvasLayer/RoundCount

func _ready() -> void:
	#When the scene starts need to make sure we are on round 1
	roundInfo.round = 1
	#Need to make sure that only 4 zombies on this first round
	roundInfo.zombies_left = 4
	# Start adding zombies
	add_zombie()
	

func add_zombie():
	for num in roundInfo.zombies_left:
		#Instantiating the zombie scene and putting it into a vaiable
		var new_zombie = zombie_scene.instantiate()
		#Adding a position to the zombie variable
		new_zombie.position = spawn_point.global_position
		#Adding the zombie to the main scene
		add_child(new_zombie)
		#Delay between zombie spawns
		await get_tree().create_timer(1.0).timeout


func round_change():
	#Want to delay the start of a new round
	await get_tree().create_timer(2.0).timeout
	#Increase the round by 1 and update it on the screen
	roundInfo.round += 1
	round_count.text = str(roundInfo.round)
	#This will add zombies after round 1 and increase the amount of zombies as well
	zombies_left_calc(roundInfo.round)

func zombies_left_calc(rounds : int):
	var zombies_left = rounds * 4
	roundInfo.zombies_left = zombies_left
	add_zombie()
	return zombies_left
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Check to see if any zombies are left
	if roundInfo.zombies_left == 0:
		#Need to make sure the if statement fires only once at the end of a round
		roundInfo.zombies_left += 1
		#Call a round change
		round_change()
