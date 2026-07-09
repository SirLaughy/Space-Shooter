extends Node2D

@export var vertical_speed: float

@onready var score_label: Label = $HUD/ScoreLabel
@onready var health_label: Label = $HUD/HealthLabel
@onready var player_new: Entity = $PlayerNew


var score: int = 0

func _process(delta: float) -> void:
	health_label.text = str(player_new.get_node("Health").health)
