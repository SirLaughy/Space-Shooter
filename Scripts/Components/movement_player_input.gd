class_name MovementPlayerInput
extends Node

@export var actor: Entity
@export var horizontal_movement_stats: HorizontalMovementStats

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		actor.velocity.x = clamp(actor.velocity.x - horizontal_movement_stats.acceleration * delta, horizontal_movement_stats.max_speed * -1, horizontal_movement_stats.max_speed)
	if Input.is_action_pressed("move_right"):
		actor.velocity.x = clamp(actor.velocity.x + horizontal_movement_stats.acceleration * delta, horizontal_movement_stats.max_speed * -1, horizontal_movement_stats.max_speed)
	if (!Input.is_action_pressed("move_left") && !Input.is_action_pressed("move_right")):
		if actor.velocity.x > 0:
			actor.velocity.x = clamp(actor.velocity.x - horizontal_movement_stats.friction * delta, 0, horizontal_movement_stats.max_speed)
		if actor.velocity.x < 0:
			actor.velocity.x = clamp(actor.velocity.x + horizontal_movement_stats.friction * delta, horizontal_movement_stats.max_speed * -1, 0)
	if (Input.is_action_pressed("move_left") && Input.is_action_pressed("move_right")):
		if actor.velocity.x > 0:
			actor.velocity.x = clamp(actor.velocity.x - horizontal_movement_stats.acceleration * delta, 0, horizontal_movement_stats.max_speed)
		if actor.velocity.x < 0:
			actor.velocity.x = clamp(actor.velocity.x + horizontal_movement_stats.acceleration * delta, horizontal_movement_stats.max_speed * -1, 0)
	
	if actor.is_on_wall():
		var normal = actor.get_wall_normal()
		if normal.x == 1.0:
			if actor.velocity.x < 0:
				actor.velocity.x = 0
		elif normal.x == -1.0:
			if actor.velocity.x > 0:
				actor.velocity.x = 0
