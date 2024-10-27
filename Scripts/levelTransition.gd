extends Node

@onready var screen = $"../BlackScreen"

func _ready() -> void:
	if screen != null:
		screen.appear.connect(on_screen_appear)
	var bobot = get_node_or_null("Bobot")
	if bobot != null:
		bobot.readyToNextLevel.connect(to_screen_appear)

func on_screen_appear() -> void:
	var door = get_node_or_null("Door")
	if door != null:
		get_tree().call_deferred("change_scene_to_file", door.getNextScenePath())

func to_screen_appear() -> void:
	screen.set_process_rect(GlobalDescRect.RECT_PROCESS_STATE.ON_APPEAR)
