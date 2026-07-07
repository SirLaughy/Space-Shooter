class_name HurtBox
extends Area2D

@export var actor: Entity
@export var damage: float = 1.0

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D):
	if body.get_children().has("HitBox"):
		body.hitbox.health_change(damage * -1)
	queue_free()
