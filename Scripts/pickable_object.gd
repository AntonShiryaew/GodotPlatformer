extends Node2D

@onready var particles = $Area2D/GPUParticles2D
@onready var sprite = $Area2D/Sprite2D

signal picked_up

func _on_gpu_particles_2d_finished() -> void:
	picked_up.emit()
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "Bobot"):
		sprite.hide()
		particles.emitting = true
