class_name Entity
extends CharacterBody2D

@export var entity_appearance: EntityAppearance

var facing_direction: Vector2

func _process(delta: float) -> void:                                        
	var temp_dir = Vector2.from_angle(global_rotation).normalized()
	facing_direction = Vector2(temp_dir.y * -1, temp_dir.x * -1)
