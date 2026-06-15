extends Node2D

@export var vertical_speed: float

@onready var score_label: Label = $HUD/ScoreLabel


var score: int = 0

func _ready() -> void:
	GlobalSignalBus.player_died.connect(_on_player_died)
	GlobalSignalBus.shoot.connect(_on_shoot)
	GlobalSignalBus.summon_enemy.connect(_on_summon_enemy)
	GlobalSignalBus.shot_enemy.connect(_on_shot_enemy)

func _on_player_died():
	get_tree().reload_current_scene()

func _on_shoot(bullet, direction, bullet_speed, location, fired_by):
	var spawned_bullet = bullet.instantiate()
	spawned_bullet.fired_by = fired_by
	spawned_bullet.direction = direction
	spawned_bullet.speed = bullet_speed
	spawned_bullet.position = location
	add_child(spawned_bullet)

func _on_summon_enemy(enemy, location, movement_type, attack_type, horizontal_speed, firing_rate, bullet_speed, vertical_speed):
	var spawned_enemy = enemy.instantiate()
	spawned_enemy.position = location
	spawned_enemy.movement_type = movement_type
	spawned_enemy.attack_type = attack_type
	spawned_enemy.horizontal_speed = horizontal_speed
	spawned_enemy.firing_rate = firing_rate
	spawned_enemy.bullet_speed  = bullet_speed
	spawned_enemy.vertical_speed = vertical_speed
	add_child(spawned_enemy)

func _on_shot_enemy():
	score +=1
	score_label.text = str(score) 
	
