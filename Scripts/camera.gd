extends Camera2D

var current_zoom = false
var zooms = [0.5, 1.5]

func changeZoom() -> void:
	var current_index = 1
	if current_zoom:
		current_index = 0
	zoom = Vector2(zooms[current_index], zooms[current_index])

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_Z:
			current_zoom = !current_zoom
			changeZoom()
