class_name Entity
extends CharacterBody2D

@export var entity_appearance: EntityAppearance

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var label: Label = $Label

func _process(delta: float) -> void:
	label.text = str(velocity)
