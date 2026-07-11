class_name MoveVerticallyOnWallInput
extends Node

@export var actor: Entity
@export var movement_stats: MovementStats
@export var movement_time: float = 60

var moving: bool = false

func _physics_process(delta: float) -> void:
	if actor.is_on_wall() && !moving:
		moving = true
		await get_tree().create_timer(movement_time/60).timeout
		moving = false
	
	if moving:
		actor.velocity.y = clamp(actor.velocity.y + movement_stats.vertical_acceleration * actor.facing_direction.y * delta, movement_stats.vertical_max_speed * -1, movement_stats.vertical_max_speed)
	if actor.velocity.y > 0 && !moving:
		actor.velocity.y = clamp(actor.velocity.y - movement_stats.vertical_friction * delta, 0, movement_stats.vertical_max_speed)
	if actor.velocity.y < 0 && !moving:
		actor.velocity.y = clamp(actor.velocity.y + movement_stats.vertical_friction * delta, movement_stats.vertical_max_speed * -1, 0)
