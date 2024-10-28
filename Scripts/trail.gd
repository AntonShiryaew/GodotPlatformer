extends Line2D

var point_length = 10
var point_velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = Vector2(0,0)
	global_rotation = 0
	
	point_velocity = get_parent().position
	
	add_point(point_velocity)
	while get_point_count() > point_length:
		remove_point(0)
