extends Node2D

func _ready() -> void:
	GlobalSignalBus.summon_projectile.connect(_on_summon_projectile)

func _on_summon_projectile(scene, projectile_stats: ProjectileStats, location: Vector2, direction: Vector2, summoner_group: GlobalEnums.group_types):
	var summoned_projectile = scene.instantiate()
	summoned_projectile.projectile_stats = projectile_stats
	summoned_projectile.position = location
	summoned_projectile.direction = direction
	summoned_projectile.summoner_group = summoner_group
	add_child(summoned_projectile)
