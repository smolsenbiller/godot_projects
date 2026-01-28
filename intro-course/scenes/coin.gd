extends Area2D
@onready var label: Label = %Label
@onready var player: CharacterBody2D = %Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_body_entered(body: Node2D) -> void:
	queue_free()
	label.score += 1
	player.scale += Vector2(0.2, 0.2)
