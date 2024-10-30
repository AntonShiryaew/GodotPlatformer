extends Area2D

@onready var particles = $GPUParticles2D
@onready var sprite = $KeySprite

signal key_picked_up

func _on_body_entered(body: Node2D) -> void:
	if(body.name == "Bobot"):
		sprite.hide()
		particles.emitting = true

func _on_gpu_particles_2d_finished() -> void:
	key_picked_up.emit()
