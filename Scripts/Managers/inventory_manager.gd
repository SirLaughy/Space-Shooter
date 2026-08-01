extends Node

var player_money: float = 0.0
var inventory: Array

func _ready() -> void:
	GlobalSignalBus.drops_dropped.connect(_on_drops_dropped)

func _on_drops_dropped(money: float, items: Array):
	player_money += money
	if items:
		for item in items:
			inventory.push_back(items[item])
