extends CanvasLayer

@onready var blue = $Panel/GridContainer/ColorRect3/blue_arrrow
@onready var yellow = $Panel/GridContainer/ColorRect4/yellow_arrow
@onready var pink = $Panel/GridContainer/ColorRect5/pink_arrow

signal check_test(passed : bool)

func _on_check_button_up() -> void:
	var test_passed : bool = false
	if blue.color.to_html(false) == "0000ff" and yellow.color.to_html(false) == "ffff00" and pink.color.to_html(false) == "ff00ff":
		test_passed = true
	check_test.emit(test_passed)
