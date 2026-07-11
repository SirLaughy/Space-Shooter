class_name SimpleVerticalMovementInput
extends Node

@export var actor: Entity
@export var movement_stats: MovementStats

func _physics_process(delta: float) -> void:
	actor.velocity.y = clamp(actor.velocity.y + movement_stats.vertical_acceleration * actor.facing_direction.y * delta, movement_stats.vertical_max_speed * -1, movement_stats.vertical_max_speed)
