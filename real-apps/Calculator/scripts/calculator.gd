extends Control

@onready var label : Label = $VBoxContainer/MarginContainer/CalculatorScreen
var temp_nums: Array
var fin_nums: Array


func _ready() -> void:
	label.text = "5318008"
	for button in $VBoxContainer/PanelContainer/GridContainer.get_children():
		if button is Button:
			button.connect('pressed', button_pressed.bind(button.text))
	%ZeroButton.connect('pressed', button_pressed.bind(%ZeroButton.text))


func button_pressed(character: String):
	if character.is_valid_int():
		print("Number: ", character)
	
	if character in ['+', '-', '/', 'x']:
		print("Function: ", character)
	
	if character == "=":
		print("output")
	
	if character == ".":
		print("decimal")
	
	if character == "%":
		print("percent")
	
	if character == "+/-":
		print("invert")
	
	if character == "c":
		print("clear")

func _on_zero_button_resized() -> void:
	%ZeroButton.offset_left = -get_window().size.x / 4.0
