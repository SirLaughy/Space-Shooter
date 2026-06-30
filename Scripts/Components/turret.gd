class_name Turret
extends Node2D

@export var turret_stats: TurretStats
@export var projectile_stats: ProjectileStats
@export var marker_top: Node2D
@export var marker_bottom: Node2D

@onready var reload_timer: Timer = $ReloadTimer

@onready var projectile = preload("res://Scenes/projectile.tscn")

func get_direction() -> Vector2:
	return marker_bottom.get_global_position().direction_to(marker_top.get_global_position())
