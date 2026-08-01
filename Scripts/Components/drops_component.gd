class_name DropsComponent
extends Node

@export var health_component: Health
@export var money: float = 0.0
@export var items: Array

func _process(delta: float) -> void:
	if health_component.health <= 0:
		GlobalSignalBus.drops_dropped.emit(money, items)
