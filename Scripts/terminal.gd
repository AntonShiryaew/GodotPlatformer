extends Area2D

@onready var canvas = $Canvas
@onready var button = $EButton

var can_interact: bool

func _input(_event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_E) and can_interact:
		canvas.visible = !canvas.visible

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Bobot":
		can_interact = true
		button.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Bobot":
		can_interact = false
		canvas.visible = false
		button.visible = false
