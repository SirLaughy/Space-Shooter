class_name TimerTriggerComponent
extends Node

@export var actor: Entity
@export var spawner_component: SpawnerComponent
@export var spawn_timer: float

func _ready() -> void:
	timer()

func timer() -> void:
	await get_tree().create_timer(spawn_timer/60).timeout
	spawner_component.spawn()
	timer()
