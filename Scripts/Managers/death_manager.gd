extends Node

@export var root: Node2D


func _ready() -> void:
	GlobalSignalBus.entity_died.connect(_on_entity_died)


func _on_entity_died(entity: Entity) -> void:
	var groups = entity.get_groups()
	if groups.has("Player"):
		get_tree().reload_current_scene()
	elif groups.has("Destructibles"):
		entity.queue_free()
