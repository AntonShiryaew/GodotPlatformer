extends Node

const SPEED = 10

@onready var screen = $BlackScreen
@onready var menu = $vlay_menu
@onready var level_selection = $vlay_level_selection

var next_scene
var simultaneous_scene = preload("res://Scenes/Tutorial_scene.tscn")

func on_screen_appear() -> void:
	get_tree().change_scene_to_packed(simultaneous_scene)

func _ready() -> void:	
	screen.appear.connect(on_screen_appear)

func _on_new_game_button_up() -> void:
	menu.visible = false
	level_selection.visible = true

func _on_back_to_menu_button_up() -> void:
	menu.visible = true
	level_selection.visible = false

func _on_exit_game_button_up() -> void:
	get_tree().quit(0)

func _on_tutorial_button_up() -> void:
	screen.set_process_rect(GlobalDescRect.RECT_PROCESS_STATE.ON_APPEAR)
	#next_scene = "res://Scenes/Tutorial_scene.tscn"
	#next_scene = "Tutorial_scene.tscn"
