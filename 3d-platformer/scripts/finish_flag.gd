extends Area3D

@export var next_level : PackedScene

func _on_body_entered(body: Node3D) -> void:
	if not body.is_in_group("Player"):
		return
	call_deferred("_load_scene")


func _load_scene():
	get_tree().change_scene_to_packed(next_level)
