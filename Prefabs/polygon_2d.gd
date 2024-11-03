extends Polygon2D

@export var colors : Array[Color]
var color_index : int = 0

func _process(_delta: float) -> void:
	if Input.is_action_just_released("left_mouse_click") and Geometry2D.is_point_in_polygon(get_local_mouse_position(), polygon):
		color_index += 1
		if color_index == colors.size():
			color_index = 0
		color = colors[color_index]
