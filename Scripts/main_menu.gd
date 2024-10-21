extends Node2D

const SPEED = 10

@onready var camera = $Camera2D
@onready var menu = $vlay_menu
@onready var level_selection = $vlay_level_selection

var current_layout

func center_layout(layout : VBoxContainer) -> float:
	return (layout.position.x + layout.size.x / 2)

func _ready() -> void:
	current_layout = menu

func _process(_delta: float) -> void:
	var center = center_layout(current_layout)
	if camera.position.x != center:
		var delta = (center - camera.position.x) / SPEED
		camera.position.x += delta

func _on_new_game_button_up() -> void:
	current_layout = level_selection

func _on_back_to_menu_button_up() -> void:
	current_layout = menu

func _on_exit_game_button_up() -> void:
	get_tree().quit(0)

func _on_tutorial_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/Tutorial_1.tscn")
