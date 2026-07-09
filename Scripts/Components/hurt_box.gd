class_name HurtBox
extends Area2D

@export var actor: Entity
@export var damage: float = 1.0

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D):
	var children = str(body.get_children())
	if children.contains("HitBox"):
		var node = body.get_node("HitBox")
		node.health_change(damage * -1)
	actor.queue_free()
