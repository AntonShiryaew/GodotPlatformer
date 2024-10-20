extends StaticBody2D

const SCALE_DELTA = 0.1

@onready var loading = is_in_group("loading_platform")

func _ready() -> void:
	if(loading):
		scale = Vector2(0.1, 0.1)

func _process(_delta: float) -> void:
	if(scale < Vector2(1, 1) and loading):
		scale += Vector2(SCALE_DELTA, SCALE_DELTA)
