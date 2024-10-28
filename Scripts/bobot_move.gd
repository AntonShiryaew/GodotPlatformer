extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

const SPEED = 300.
const JUMP_FORCE = -400.
var can_doublejump:bool = true

var readyToDisappear = false

signal readyToNextLevel

func call_end() -> void:
	readyToDisappear = true

func check_collision() -> void:
	for index in get_slide_collision_count():
		var collider = get_slide_collision(index).get_collider()
		if collider.is_in_group("jumping"):
			velocity.y = JUMP_FORCE * 2

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("ui_down") && is_on_floor()):
		position.y += 10

func _physics_process(delta: float) -> void:
	if readyToDisappear:
		if modulate.a < 0 :
			readyToNextLevel.emit()
		else:
			modulate.a -= 0.08
			_animated_sprite.play("jump")
	else:
		velocity += get_gravity() * delta
		
		if Input.is_action_just_pressed("ui_select") and is_on_floor():
			can_doublejump = true
			velocity.y = JUMP_FORCE
		
		if Input.is_action_just_pressed("ui_select") and !is_on_floor() and can_doublejump:
			can_doublejump = false
			velocity.y = JUMP_FORCE
		
		var direction = Input.get_axis("ui_left", "ui_right")
		
		if direction > 0:
			_animated_sprite.flip_h = false
		elif direction < 0:
			_animated_sprite.flip_h = true 
			
		if is_on_floor():
			if direction == 0:
				_animated_sprite.play("idle")
			else:
				_animated_sprite.play("walk")
		else:
			_animated_sprite.play("jump")
		
		velocity.x = direction * SPEED
		
		move_and_slide()
		check_collision()
