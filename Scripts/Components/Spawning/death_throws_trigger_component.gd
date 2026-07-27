class_name DeathThrowsTriggerComponent
extends Node

@export var actor: Entity
@export var spawner_component: SpawnerComponent
@export var health_component: Health

var spawned = false

func _process(delta: float) -> void:
	if health_component.health <= 0 && !spawned:
		spawner_component.spawn()
		spawned = true
