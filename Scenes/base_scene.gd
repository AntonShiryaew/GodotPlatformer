extends ColorRect

class_name GlobalDescRect
#состояния процесса
enum RECT_PROCESS_STATE {NONE = -1, ON_APPEAR, ON_DISAPPEAR}

#состояния ColorRect-a
enum RECT_STATE {APPEAR, DISAPPEAR}

#базовый размер
const BASE_SHIT_SCALE = Vector2(0.00001, 0.00001)
#const PATH_TO_COLOR_RECT = "/root/BaseScene/ColorRect"

var rect_process_state = RECT_PROCESS_STATE.ON_DISAPPEAR #текущий процесс
var rect_state = RECT_STATE.DISAPPEAR                    #текущее состояние ColorRect-a
var vector_delta                                         #скорость изменения масштаба
var angle_delta                                          #скорость угла вращения
var rect = self

signal appear    #появился на экране

func _ready() -> void:
	rect.visible = true
	rect.pivot_offset = Vector2(rect.size.x / 2, rect.size.y / 2)

func to_disappear() -> bool:
	if rect.scale == BASE_SHIT_SCALE:
		return true
	else:
		rect.rotation -= angle_delta
		rect.scale -= vector_delta
		if rect.scale < Vector2.ZERO:
			rect.scale = Vector2.ZERO
	return false
			
func to_appear() -> bool:
	if rect.scale == Vector2.ONE:
		appear.emit()
		return true
	else:
		rect.rotation += angle_delta
		rect.scale += vector_delta
		if rect.scale > Vector2.ONE:
			rect.rotation = 0
			rect.scale = Vector2.ONE
	return false

func set_process_rect(enum_process: RECT_PROCESS_STATE) -> void:
	rect_process_state = enum_process
	
func get_process_rect() -> RECT_PROCESS_STATE:
	return rect_process_state

func _process(delta: float) -> void:
	vector_delta = Vector2(1 * delta, 1 * delta)
	angle_delta = 3 * delta
	if rect_process_state == RECT_PROCESS_STATE.NONE:
		pass
	elif rect_process_state == RECT_PROCESS_STATE.ON_DISAPPEAR:
		if to_disappear():
			rect_process_state = RECT_PROCESS_STATE.NONE
	elif rect_process_state == RECT_PROCESS_STATE.ON_APPEAR:
		if to_appear():
			rect_process_state = RECT_PROCESS_STATE.NONE
