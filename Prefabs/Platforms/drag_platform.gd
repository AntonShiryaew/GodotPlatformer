extends Node2D

var selected:bool = false

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if selected:
		global_position = get_global_mouse_position()

func _on_animatable_body_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print("pass")
	if (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT):
		selected = event.pressed
		print("hui")
