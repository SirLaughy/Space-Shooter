class_name SpawnerComponent
extends Node

@export var actor: Entity
@export var spawns_per_attempt: int = 1
@export var spawn_offset: Vector2 = Vector2(0 , 0)
@export var weight_table: Dictionary[int, PackedSceneArray]

func spawn() -> void:
	for n in spawns_per_attempt:
		var entity = get_entity(get_rarity_table())
		GlobalSignalBus.summon_enemy.emit(entity, actor.global_position, spawn_offset)

func get_rarity_table() -> PackedSceneArray:
	var generated_number = randi_range(1,100)
	var temp_weight: int
	
	for weight in weight_table:
		if generated_number >= weight && weight_table[weight]:
			temp_weight = weight
	
	return weight_table[temp_weight]
	

func get_entity(array: PackedSceneArray) -> PackedScene:
	return array.scene_array[randi_range(0, array.scene_array.size()) -1]
