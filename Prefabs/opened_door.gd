extends StaticBody2D

func on_test_passed(passed : bool):
	if passed:
		queue_free()

func _ready() -> void:
	get_parent().get_node("Terminal_task/Canvas").check_test.connect(on_test_passed)
