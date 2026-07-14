class_name DeathThrowsTriggerComponent
extends Node

@export var actor: Entity
@export var spawner_component: SpawnerComponent

func _exit_tree() -> void:
	print("tree exited")
	spawner_component.spawn()
