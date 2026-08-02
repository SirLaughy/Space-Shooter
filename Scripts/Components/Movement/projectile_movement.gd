class_name ProjectileMovement
extends Node

@export var actor: Entity

@onready var stats = actor.projectile_stats

func _physics_process(delta: float) -> void:
	if actor.ticking:
		actor.velocity = ((actor.direction * stats.speed) * delta)
		actor.move_and_slide()
