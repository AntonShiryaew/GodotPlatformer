extends Node

@onready var screen = $"../BlackScreen"

var door : Node
var key : Node

func _ready() -> void:
	if get_parent().get_script().get_global_name() == "BaseScene":
		get_parent().game_paused.connect(on_game_paused)
	screen.appear.connect(on_screen_appear)
	door = get_node_or_null("Door")
	var bobot = get_node_or_null("Bobot")
	if bobot != null:
		bobot.readyToNextLevel.connect(to_screen_appear)
	key = get_node_or_null("Key")
	if key != null:
		key.picked_up.connect(on_key_picked_up)
		if door != null:
			door.get_node("Particles").amount_ratio = 0

func on_game_paused(paused: bool) -> void:
	if door != null:
		if paused:
			door.get_node("Particles").amount_ratio = 0
		else:
			if key == null:
				door.get_node("Particles").amount_ratio = 1

func on_key_picked_up() -> void:
	if door != null:
		door.get_node("Particles").amount_ratio = 1

func on_screen_appear() -> void:
	if door != null:
		get_tree().call_deferred("change_scene_to_file", door.getNextScenePath())

func to_screen_appear() -> void:
	screen.set_process_rect(GlobalDescRect.RECT_PROCESS_STATE.ON_APPEAR)
