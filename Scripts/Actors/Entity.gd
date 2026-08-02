class_name Entity
extends CharacterBody2D

### EXPORT VARIABLES

@export var entity_appearance: EntityAppearance
@export var bounding_box: CollisionShape2D

### VARIABLE DECLARATIONS

var facing_direction: Vector2
var signal_defer_frame = false
var check_defer = false # called by health module upon reaching 0 health
var ticking: bool = true # whether to be ticking

### BUILT-IN FUNCTIONS

func _ready() -> void:
	GlobalSignalBus.start_gameplay.connect(_on_start_gameplay)
	GlobalSignalBus.pause_gameplay.connect(_on_pause_gameplay)

func _process(delta: float) -> void:                                        
	facing_direction = get_direction()
	if check_defer:
		defer_signal()
		

### CUSTOM FUNCTIONS

# Return the direction the entity is facing 
func get_direction() -> Vector2:
	var temp_dir = Vector2.from_angle(global_rotation).normalized()
	return Vector2(temp_dir.y * -1, temp_dir.x * -1)

# Defers the death signal of the entity by one frame to ensure all code that triggers on death is executed
func defer_signal() -> void:
	if signal_defer_frame:
		signal_defer_frame = false
		check_defer = false
		GlobalSignalBus.entity_died.emit(self)
	else:
		signal_defer_frame = true
		

# Returns the size of the entity bounding box
func get_size() -> Vector2:
	return bounding_box.shape.size
	

### SIGNAL CONNECTIONS

func _on_start_gameplay():
	ticking = true

func _on_pause_gameplay():
	ticking = false
