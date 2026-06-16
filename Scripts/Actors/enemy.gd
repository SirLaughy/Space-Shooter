extends CharacterBody2D

@export var movement_type: GlobalEnums.movement_type
@export var attack_type: GlobalEnums.attack_type
@export var horizontal_speed: float
@export var firing_rate: float
@export var bullet_speed: float
@export var vertical_speed: float

@onready var bullet_timer: Timer = $BulletTimer

var direction: Vector2
var onscreen: bool = false

var bullet_scene = preload("res://Scenes/bullet.tscn")
var enemy_scene = preload("res://Scenes/Actors/enemy.tscn")

func _ready() -> void:
	match movement_type:
		GlobalEnums.movement_type.STATIC:
			direction = Vector2(0, 1)
			modulate.r = 0
		GlobalEnums.movement_type.HORIZONTAL:
			direction = Vector2(1, 1)
			modulate.r = 255
	
	match attack_type:
		GlobalEnums.attack_type.GUN:
			bullet_timer.wait_time = firing_rate / 60
			bullet_timer.start()
			modulate.g = 0
		GlobalEnums.attack_type.BULLBAR:
			modulate.g = 255
		GlobalEnums.attack_type.SPAWNER:
			set_collision_layer_value(4, false)
			bullet_timer.wait_time = firing_rate / 60
			bullet_timer.start()
			

func _process(delta: float) -> void:
	velocity.x = horizontal_speed * direction.x
	velocity.y = vertical_speed * direction.y

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		var collider_groups = collider.get_groups()
		if collider_groups.has("Walls"):
			direction.x *= -1
		if collider_groups.has("Player"):
			GlobalSignalBus.player_died.emit()


func shoot():
	GlobalSignalBus.shoot.emit(bullet_scene, Vector2(0, 1), bullet_speed, global_position, GlobalEnums.fired_by.ENEMY)

func spawn_enemy():
	var spawn_movement_type = randi_range(0,1)
	var spawn_attack_type = randi_range(0,1)
	GlobalSignalBus.summon_enemy.emit(enemy_scene, global_position, spawn_movement_type, spawn_attack_type, 100, 120, 300, 50)

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	onscreen = true

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_bullet_timer_timeout() -> void:
	print("a")
	match attack_type:
		GlobalEnums.attack_type.GUN:
			if onscreen:
				shoot()
		GlobalEnums.attack_type.SPAWNER:
			print("spawn")
			spawn_enemy()
	print("b")
	bullet_timer.wait_time = bullet_speed / 60
