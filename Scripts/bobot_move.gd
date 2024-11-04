extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var jump_sound = $JumpSound
 
const SPEED = 300.
const JUMP_FORCE = -400.

var can_doublejump:bool = true
var readyToDisappear:bool = false

signal readyToNextLevel

func call_end() -> void:
	readyToDisappear = true

func check_collision() -> void:
	for index in get_slide_collision_count():
		var collider = get_slide_collision(index).get_collider()
		if collider.is_in_group("jumping"):
			velocity.y = JUMP_FORCE * 2

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_down") and is_on_floor():
		position.y += 10
	if event.is_action_pressed("ui_select"):
		if is_on_floor() or (!is_on_floor() and can_doublejump):
			velocity.y = JUMP_FORCE
			jump_sound.play()
		can_doublejump = is_on_floor()

func _physics_process(delta: float) -> void:
	if readyToDisappear:
		if modulate.a < 0 :
			readyToNextLevel.emit()
		else:
			modulate.a -= 0.08
			_animated_sprite.play("jump")
	else:
		velocity += get_gravity() * delta
		var direction = Input.get_axis("ui_left", "ui_right")
		velocity.x = direction * SPEED
		
		move_and_slide()
		check_collision()
		update_animation(direction)

func update_animation(direction):
	_animated_sprite.flip_h = direction < 0
	if !is_on_floor():
		_animated_sprite.play("jump")
	elif direction == 0:
		_animated_sprite.play("idle")
	else:
		_animated_sprite.play("walk")
