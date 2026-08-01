class_name TimerTriggerComponent
extends Node

@export var actor: Entity
@export var spawner_component: SpawnerComponent
@export var spawn_timer_range: Vector2 = Vector2(60 , 60)

func _ready() -> void:
	timer()

func timer() -> void:
	await get_tree().create_timer(randf_range(spawn_timer_range.x, spawn_timer_range.y)/60).timeout
	spawner_component.spawn()
	timer()
