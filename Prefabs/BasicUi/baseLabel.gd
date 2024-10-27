@tool
class_name BaseLabel extends Label

func _ready() -> void:
	var font_bulatov = load("res://Fonts/BulatovSPDemo.otf")
	add_theme_font_override("font", font_bulatov)
	add_theme_font_size_override("font_size", 30)
