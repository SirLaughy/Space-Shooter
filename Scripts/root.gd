extends Node2D

@export var vertical_speed: float

@onready var label: Label = $HUD/Label
@onready var player_new: Entity = $PlayerNew
@onready var inventory_manager: Node = $InventoryManager
@onready var end_score_label: Label = $HUD/EndScoreLabel
@onready var game_timer: Timer = $GameTimer

func die():
	GlobalSignalBus.pause_gameplay.emit()
	end_score_label.text = "Money: $" + str(inventory_manager.player_money) + "\nLasted: " + str(game_timer.seconds) + " secs"
	end_score_label.visible = true
	await get_tree().create_timer(5).timeout
	get_tree().reload_current_scene()

func _process(delta: float) -> void:
	label.text = "Health: " + str(int(player_new.get_node("Health").health)) + " | Money: $" + str(inventory_manager.player_money)
