extends Node2D

func _ready() -> void:
	GlobalSignalBus.summon_projectile.connect(_on_summon_projectile)

func _on_summon_projectile(scene, projectile_stats: ProjectileStats, location: Vector2, angle: float, summoner_type: GlobalEnums.group_types):
	var summoned_projectile = scene.instantiate()
	summoned_projectile.projectile_stats = projectile_stats
	summoned_projectile.position = location
	summoned_projectile.rotation = angle
	summoned_projectile.summoner_type = summoner_type
	add_child(summoned_projectile)
