class_name BaseScene extends Node

signal game_paused(paused : bool)

@onready var screen = $BlackScreen

func set_game_pause(pause : bool) -> void:
	get_tree().paused = pause
	game_paused.emit(get_tree().paused)

func _input(event:InputEvent) -> void:
	if screen.get_process_rect() == GlobalDescRect.RECT_PROCESS_STATE.NONE:
		if event.is_action_pressed("ui_cancel"):
			var is_paused : bool = get_tree().paused
			set_game_pause(!is_paused)
