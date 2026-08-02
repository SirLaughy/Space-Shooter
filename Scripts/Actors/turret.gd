class_name Turret
extends Node2D

@export var turret_stats: TurretStats
@export var projectile_stats: ProjectileStats

@onready var reload_timer: Timer = $ReloadTimer
@onready var projectile = preload("res://Scenes/projectile.tscn")

var ticking: bool = true

### BUILT-IN FUNCTIONS

func _ready() -> void:
	GlobalSignalBus.start_gameplay.connect(_on_start_gameplay)
	GlobalSignalBus.pause_gameplay.connect(_on_pause_gameplay)

### SIGNAL CONNECTIONS

func _on_start_gameplay():
	ticking = true

func _on_pause_gameplay():
	ticking = false
