class_name MovementPlayerInput
extends Node

@export var actor: CharacterBody2D
@export var movement_stats: MovementStats

var direction= Vector2(0, 0)

func _input(event: InputEvent) -> void:
	if event.is_action("move_left"):
		direction.x = -1
	elif event.is_action("move_right"):
		direction.x = 1
	else:
		direction.x = 0

func _physics_process(delta: float) -> void:
	if direction.x != 0:
		actor.velocity = actor.velocity.move_toward(direction * movement_stats.horizontal_speed, movement_stats.acceleration * delta)
	else:
		actor.velocity = actor.velocity.move_toward(Vector2.ZERO, movement_stats.friction * delta)
