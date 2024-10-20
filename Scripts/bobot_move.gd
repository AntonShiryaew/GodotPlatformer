extends CharacterBody2D

const SPEED = 300.
const JUMP_FORCE = -400.

var player_in_end

@onready var _animated_sprite = $AnimatedSprite2D

#Label

func _ready() -> void:
	player_in_end = false

#func _process(delta: float) -> void:
	#print(String.num(velocity.y))

func call_end() -> void:
	player_in_end = true

func check_collision() -> void:
	for index in get_slide_collision_count():
		var collider = get_slide_collision(index).get_collider()
		if collider.is_in_group("jumping"):
			velocity.y = JUMP_FORCE * 2

func _physics_process(delta: float) -> void:
	if(player_in_end):
		modulate.a -= 0.08
		_animated_sprite.play("jump")
	else:	
		velocity += get_gravity() * delta
		
		if Input.is_action_just_pressed("ui_select") and is_on_floor():
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
