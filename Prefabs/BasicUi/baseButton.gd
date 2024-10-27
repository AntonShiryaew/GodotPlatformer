@tool
class_name BaseGameButton extends Button

@export var isActiveButton = true 

func _ready() -> void:
	var font_bulatov = load("res://Fonts/BulatovSPDemo.otf")
	add_theme_font_override("font", font_bulatov)
	add_theme_font_size_override("font_size", 30)
	if !isActiveButton :
		disabled = true
		add_theme_stylebox_override("focus", StyleBoxEmpty.new())
		add_theme_stylebox_override("disabled", get_theme_stylebox("normal"))
		add_theme_color_override("font_disabled_color", get_theme_color("font_color"))
