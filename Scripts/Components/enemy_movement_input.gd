class_name EnemyMovementInput
extends Node

@export var actor: Entity
@export var movement_stats: HorizontalMovementStats

var x_direction = 1

func _physics_process(delta: float) -> void:
	actor.velocity.x = clamp((actor.velocity.x + movement_stats.acceleration) * x_direction * delta, movement_stats.max_speed * -1, movement_stats)

	if actor.is_on_wall():
		var normal = actor.get_wall_normal()
		
		if (actor.velocity.x > 0 && normal.x > 0) || (actor.velocity.x < 0 && normal.x < 0):
			actor.velocity.x = 0
			x_direction *= -1
