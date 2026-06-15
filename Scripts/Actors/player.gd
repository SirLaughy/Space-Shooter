extends CharacterBody2D

@export var horizontal_acceleration: float
@export var vertical_acceleration: float
@export var firing_speed: float
@export var bullet_speed: float

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bullet_timer: Timer = $BulletTimer

var bullet_scene = preload("res://Scenes/bullet.tscn")

func _ready() -> void:
	GlobalSignalBus.player_move.connect(_on_player_move)
	bullet_timer.wait_time = firing_speed / 60

func _physics_process(delta: float) -> void:
	move_and_slide()

func _on_player_move(player_direction):
	match player_direction:
		GlobalEnums.direction.LEFT:
			velocity.x = horizontal_acceleration * -1
		GlobalEnums.direction.RIGHT:
			velocity.x = horizontal_acceleration
		GlobalEnums.direction.NIL:
			velocity.x = 0;

func shoot():
	GlobalSignalBus.shoot.emit(bullet_scene, Vector2(0, -1), bullet_speed, global_position, GlobalEnums.fired_by.PLAYER)

func _on_bullet_timer_timeout() -> void:
	shoot()
	bullet_timer.wait_time = firing_speed / 60
