extends ColorRect

class_name GlobalDescRect

#состояния процесса
enum RECT_PROCESS_STATE {NONE = -1, ON_APPEAR, ON_DISAPPEAR}
#скорость появления и исчезновения
const SPEED = 0.05
#текущий процесс
var rect_process_state = RECT_PROCESS_STATE.ON_DISAPPEAR
#сигнал появления на экране
signal appear

func _ready() -> void:
	visible = true
	pivot_offset = Vector2(size.x / 2, size.y / 2)
	size = get_viewport_rect().size;

func to_disappear() -> bool:
	if modulate.a <= 0:
		modulate.a = 0
		scale = Vector2.ZERO
		return true
	else:
		modulate.a -= SPEED
	return false

func to_appear() -> bool:
	if modulate.a >= 1:
		modulate.a = 1
		appear.emit()
		return true
	else:
		modulate.a += SPEED
	return false

func set_process_rect(enum_process: RECT_PROCESS_STATE) -> void:	
	rect_process_state = enum_process
	scale = Vector2.ONE
	
func get_process_rect() -> RECT_PROCESS_STATE:
	return rect_process_state

func _process(_delta: float) -> void:
	if rect_process_state == RECT_PROCESS_STATE.NONE:
		pass
	elif rect_process_state == RECT_PROCESS_STATE.ON_DISAPPEAR:
		if to_disappear():
			rect_process_state = RECT_PROCESS_STATE.NONE
	elif rect_process_state == RECT_PROCESS_STATE.ON_APPEAR:
		if to_appear():
			rect_process_state = RECT_PROCESS_STATE.NONE
