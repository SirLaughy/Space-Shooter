class_name SpawnerComponent
extends Node

### EXPORT VARIABLES

@export var actor: Entity # entity node this component is attached to
@export var spawn_quantity_range: Vector2 = Vector2(1 , 1) # the range of spawns to choose between
@export var spawning_points: Array[Marker2D] # pre-determined spawning locations to choose between
@export var weight_table: Dictionary[int, PackedSceneArray] # a dictionary with the weighting and an array of entities to spawn

### CUSTOM FUNCTIONS

# Determines the amount of enemies to spawn based on the spawn_quantity_range and sends the determined entity and spawning marker to the spawn manager, called by trigger component
func spawn() -> void:
	var spawn_quantity = randi_range(spawn_quantity_range.x, spawn_quantity_range.y) # determine spawn quantity
	var markers = spawning_points.duplicate() # duplicate the array of spawning markers to allow to only choose each location a maximum of one time
	for n in spawn_quantity: #loop through for amount of spawns and send the chosen entity and spawning location to spawn manager
		var entity = get_entity(get_rarity_table())
		var marker = markers.pop_at(randi_range(0, markers.size() - 1)) # remove each selected marker from the array to ensure each marker can only be selected once per spawn cycle
		GlobalSignalBus.summon_enemy.emit(entity, marker.global_position)

# use the weights provided in the weight table to randomly select the entity array to choose an entity from
func get_rarity_table() -> PackedSceneArray:
	var generated_number = randi_range(1,100) #generate a number between 1 and 100
	var temp_weight: int #initialise a local variable to temporarily store weights
	
	for weight in weight_table: #if the random number is greater than or equal to the weight number make it the temp_weight
		if generated_number >= weight && weight_table[weight]:
			temp_weight = weight
	
	return weight_table[temp_weight] # return the weight table at the temp_weight location to allow for checking each weight catergory and returning the closest array regardless of how full the array is
	
# return a random entity in the entity array
func get_entity(array: PackedSceneArray) -> PackedScene:
	return array.scene_array[randi_range(0, array.scene_array.size()) -1]
