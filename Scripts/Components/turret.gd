class_name Turret
extends RayCast2D

@export var turret_stats: TurretStats
@export var projectile_stats: ProjectileStats

@onready var reload_timer: Timer = $ReloadTimer

@onready var projectile = preload("res://Scenes/projectile.tscn")

func get_direction() -> Vector2:
	return target_position - position
