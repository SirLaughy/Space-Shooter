extends Node2D

@export var vertical_speed: float

@onready var label: Label = $HUD/Label
@onready var player_new: Entity = $PlayerNew
@onready var inventory_manager: Node = $InventoryManager

func _process(delta: float) -> void:
	label.text = "Health: " + str(int(player_new.get_node("Health").health)) + " | Money: $" + str(inventory_manager.player_money)
