class_name DeathThrowsTriggerComponent
extends Node

@export var actor: Entity
@export var spawner_component: SpawnerComponent

func _ready() -> void:
	GlobalSignalBus.entity_died.connect(_on_entity_died)

func _on_entity_died(entity: Entity) -> void:
	if entity == actor:
		spawner_component.spawn()
