class_name HurtBox
extends Area2D

@export var actor: Entity

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D):
	pass
