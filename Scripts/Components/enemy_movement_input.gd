class_name EnemyMovementInput
extends Node

@export var actor: Entity
@export var movement_stats: HorizontalMovementStats

var x_direction = 1
var checking_for_walls: bool = true

func _physics_process(delta: float) -> void:
	actor.velocity.x = clamp(actor.velocity.x + (movement_stats.acceleration * x_direction) * delta, movement_stats.max_speed * -1, movement_stats.max_speed)

	if actor.is_on_wall():
		var normal = actor.get_wall_normal()
		if ((actor.velocity.x > 0 && normal.x < 0) || (actor.velocity.x < 0 && normal.x > 0)) && checking_for_walls:
			actor.velocity.x = 0
			checking_for_walls = false
			x_direction *= -1
	
	if !actor.is_on_wall() && !checking_for_walls:
		checking_for_walls = true
