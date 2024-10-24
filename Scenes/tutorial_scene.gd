extends Node

@onready var screen = $BlackScreen
@onready var sscreen = $Tutorial1

func _process(_delta: float) -> void:
	if sscreen.visible == false:
		if screen.get_process_rect() != GlobalDescRect.RECT_PROCESS_STATE.NONE:
			sscreen.visible = true
