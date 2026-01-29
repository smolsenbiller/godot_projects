extends TextureRect

@onready var main : Node2D = $".."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if main.game_start == true:
		if main.game_over == false:
			global_position.x -= 100 * delta
			
			if global_position.x <= -160:
				global_position.x = 0
