class_name OneTimeTriggerComponent
extends Node

@export var actor: Entity
@export var spawner_component: SpawnerComponent

func _ready() -> void:
	spawner_component.spawn()
	actor.queue_free()
