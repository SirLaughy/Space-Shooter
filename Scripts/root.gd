extends Node2D

@export var vertical_speed: float

func _ready() -> void:
	GlobalSignalBus.player_died.connect(_on_player_died)
	GlobalSignalBus.shoot.connect(_on_shoot)

func _on_player_died():
	get_tree().reload_current_scene()

func _on_shoot(bullet, direction, bullet_speed, location, fired_by):
	var spawned_bullet = bullet.instantiate()
	add_child(spawned_bullet)
	spawned_bullet.direction = direction
	spawned_bullet.speed = bullet_speed
	spawned_bullet.position = location
	spawned_bullet.fired_by = fired_by
