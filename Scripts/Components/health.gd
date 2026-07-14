class_name Health
extends Node

@export var actor: Entity
@export var max_health: float


@onready var health: float = max_health

func update_values() -> void:
	if health <= 0:
		GlobalSignalBus.entity_died.emit(actor)
	print(str(actor.name) + " | " + str(health))
