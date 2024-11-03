extends Node2D

var center_circle
var max
var eye_rad
var max_vector
var following_objcet

func _ready() -> void:
	center_circle = Vector2(0,0)
	max = 200
	eye_rad = 50
	max_vector = Vector2(max, max)

func _draw() -> void:
	draw_circle(Vector2(0,0), max, Color.BROWN, false, 5)
	draw_circle(center_circle, eye_rad, Color.BLACK)
	
func _process(_delta: float) -> void:
	queue_redraw()
	following_objcet = get_parent().bobot.global_position
	var mouse_pos = following_objcet
	var gl_pos = global_position
	var one_x = mouse_pos.x
	var one_y = mouse_pos.y
	
	var a = following_objcet.x - global_position.x
	var b = following_objcet.y - global_position.y
	if (b == 0): b = 0.0001
	if (a == 0): a = 0.0001

	var c = sqrt(pow(a, 2) + pow(b, 2))
	var cos_angle = (pow(a, 2) + pow(c, 2) - pow(b, 2)) / (2 * a * c)
	var angle = acos(cos_angle)
	
	var is_top:bool = following_objcet.y < global_position.y
	if (c > max): c = max;
	var pos_x = (c - eye_rad) * cos(angle)
	var pos_y = (c - eye_rad) * sin(angle)
	if (is_top): pos_y = -pos_y

	center_circle = Vector2(pos_x, pos_y)
