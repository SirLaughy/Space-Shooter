class_name DeathThrowsTriggerComponent
extends Node

@export var actor: Entity
@export var spawner_component: SpawnerComponent
@export var health_component: Health

var dead: bool = false

func _process(delta: float) -> void:
	if health_component.health <= 0 && !dead:
		spawner_component.spawn()
		dead = true
