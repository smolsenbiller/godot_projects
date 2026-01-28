extends Node2D

var star_scene : PackedScene = preload("res://Loops/star.tscn")

func _ready() -> void:
	for num in range(500):
		var star = star_scene.instantiate()
		add_child(star)
		
		var star_x = randf_range(0.0, 1154.0)
		var star_y = randf_range(0.0, 648.0)
		star.position = Vector2(star_x, star_y)
		
		var star_scale = randf_range(0.5, 3.0)
		star.scale = Vector2(star_scale, star_scale)
