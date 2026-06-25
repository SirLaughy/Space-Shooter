class_name HurtBox
extends Area2D

@export var actor: Entity
@onready var stats = actor.projectile_stats

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func init_masks():
	match stats.summoner_type:
		GlobalEnums.group_types.PLAYER:
			set_collision_mask_value(4, true)
		GlobalEnums.group_types.DESTRUCTIBLES:
			set_collision_mask_value(1, true)

func _on_body_entered(body: Node2D):
	pass
