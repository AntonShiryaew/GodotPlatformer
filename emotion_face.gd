extends Node2D

@export var bobot : CharacterBody2D

var appear : bool = false

#переписать нахуй это говно
func _ready() -> void:
	modulate.a = 0
	await get_tree().create_timer(3).timeout
	appear = true
	get_node("AudioPlayer").playing = true
	
	await get_tree().create_timer(3).timeout
	get_parent().get_node("Label").visible = true
	await get_tree().create_timer(3).timeout
	get_parent().get_node("Label2").visible = true
	await get_tree().create_timer(3).timeout
	get_parent().get_node("Label3").visible = true
	
	await get_tree().create_timer(3).timeout
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/MainMenu/mainMenu.tscn")
	
func _process(delta: float) -> void:
	if appear:
		modulate.a += delta
