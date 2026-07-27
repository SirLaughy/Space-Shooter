class_name Entity
extends CharacterBody2D

@export var entity_appearance: EntityAppearance
@export var bounding_box: CollisionShape2D

var facing_direction: Vector2
var signal_defer_frame = false
var check_defer = false


func _process(delta: float) -> void:                                        
	facing_direction = get_direction()
	if check_defer:
		defer_signal()
		

func get_direction() -> Vector2:
	var temp_dir = Vector2.from_angle(global_rotation).normalized()
	return Vector2(temp_dir.y * -1, temp_dir.x * -1)

func defer_signal() -> void:
	if signal_defer_frame:
		signal_defer_frame = false
		check_defer = false
		GlobalSignalBus.entity_died.emit(self)
	else:
		signal_defer_frame = true
		
func get_size() -> Vector2:
	return bounding_box.shape.size
