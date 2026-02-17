extends Node

@onready var selection_sprite = $"../SelectionSprite"

func toggle_selection_visual(toggle : bool):
	selection_sprite.visible = toggle
