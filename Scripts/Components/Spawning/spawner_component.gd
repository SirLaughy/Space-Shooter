class_name SpawnerComponent
extends Node

@export var actor: Entity
@export var spawn_quantity_range: Vector2 = Vector2(1 , 1)
@export var spawning_area: CollisionShape2D
@export var weight_table: Dictionary[int, PackedSceneArray]

var to_be_spawned: Array[PackedScene]
var sizes: Array[Vector2]

func queue_spawns() -> void:
	var spawn_quantity = randi_range(spawn_quantity_range.x, spawn_quantity_range.y)
	for n in spawn_quantity:
		var entity = get_entity(get_rarity_table())
		sizes.push_back(entity.get_size())
		to_be_spawned.push_back(entity)
	spawn()

func spawn() -> void:
	var spawn_locations: Array[Vector2]
	

func get_rarity_table() -> PackedSceneArray:
	var generated_number = randi_range(1,100)
	var temp_weight: int
	
	for weight in weight_table:
		if generated_number >= weight && weight_table[weight]:
			temp_weight = weight
	
	return weight_table[temp_weight]
	

func get_entity(array: PackedSceneArray) -> PackedScene:
	return array.scene_array[randi_range(0, array.scene_array.size()) -1]
