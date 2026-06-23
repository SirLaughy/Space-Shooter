class_name Projectile
extends Entity

var projectile_stats: ProjectileStats
var direction: Vector2
var summoner_type: GlobalEnums.group_types

func _ready() -> void:
	modulate = projectile_stats.colour
