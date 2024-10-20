extends Area2D

@onready var collider_scale = $CollisionShape2D.shape.size

func _draw() -> void:
	var stroke_width = 10
	var offset_stroke = stroke_width / 2.
	var offset_x = collider_scale.x / 2.
	var offset_y = collider_scale.y / 2.
	draw_rect(Rect2(-offset_x, -offset_y, collider_scale.x, collider_scale.y), Color.hex(070809), false, stroke_width)
	draw_rect(Rect2(-offset_x + offset_stroke, -offset_y + offset_stroke, collider_scale.x - stroke_width, collider_scale.y - stroke_width), Color.from_string("66CCCC88", Color.DARK_CYAN))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	queue_redraw()

func _on_body_entered(body: Node2D) -> void:
	if(body.name == "CharacterBody2D"):
		body.call_end()