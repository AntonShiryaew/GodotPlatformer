extends Control

@export var parentNode : BaseScene

func _ready() -> void:
	parentNode.connect("game_paused", on_game_pause_change)

func on_game_pause_change(paused : bool) -> void:
	if paused:
		show()
	else:
		hide()

func _on_to_continue_button_up() -> void:
	parentNode.set_game_pause(false)

func _on_to_reload_level_button_up() -> void:
	parentNode.set_game_pause(false)
	get_tree().call_deferred("reload_current_scene")

func _on_to_main_menu_button_up() -> void:
	parentNode.set_game_pause(false)
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/MainMenu/mainMenu.tscn")
