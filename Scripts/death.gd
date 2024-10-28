extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	get_tree().create_timer(0.5).timeout.connect(_delayed_scene_restart)

func _delayed_scene_restart():
	get_tree().call_deferred("reload_current_scene")
