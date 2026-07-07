class_name HitBox
extends CollisionShape2D

@export var actor: Entity
@export var health: Health

func health_change(amount: float) -> void:
	health.health = clamp(health.health + amount, 0, health.max_health)
	health.update_values()
