extends CharacterBody2D

const PLAYER_WIDTH = 64.0

@export var horizontal_acceleration : float = 100
@export var firing_rate : float = 1.0

@onready var left_sprite: Sprite2D = $Thrusters/LeftSprite
@onready var right_sprite: Sprite2D = $Thrusters/RightSprite
@onready var muzzle: Area2D = $Weapon/Muzzle
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var horizontal_speed : float = 0

func _physics_process(delta: float) -> void:
	handle_movement(delta)

func handle_movement(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		horizontal_speed -= horizontal_acceleration
	elif Input.is_action_pressed("move_right"):
		horizontal_speed += horizontal_acceleration
	else:
		if horizontal_speed != 0:
			horizontal_speed = move_toward(horizontal_speed, 0, horizontal_acceleration * 2)
	horizontal_speed = clamp(horizontal_speed, (horizontal_acceleration * -16), (horizontal_acceleration * 16))
	velocity.x = horizontal_speed * delta
	move_and_slide()
	global_position.x = clamp(position.x, 0 + (PLAYER_WIDTH / 2) , 180 - (PLAYER_WIDTH /2))

func handle_animation() -> void:
	pass

func shoot_laser() -> void:
	pass
