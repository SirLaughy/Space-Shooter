extends Node2D

func _ready() -> void:
	GlobalSignalBus.summon_projectile.connect(_on_summon_projectile)
	GlobalSignalBus.summon_enemy.connect(_on_summon_enemy)

func _on_summon_projectile(scene, projectile_stats: ProjectileStats, location: Vector2, angle: float, summoner_type: GlobalEnums.group_types) -> void:
	var summoned_projectile = scene.instantiate()
	summoned_projectile.projectile_stats = projectile_stats
	summoned_projectile.position = location
	summoned_projectile.rotation = angle
	summoned_projectile.summoner_type = summoner_type
	add_child.call_deferred(summoned_projectile)

func _on_summon_enemy(scene: PackedScene, location: Vector2, offset: Vector2) -> void:
	var summoned_enemy = scene.instantiate()
	summoned_enemy.position = location + offset
	print(str(summoned_enemy.name) + " summoned | " + str(location + offset))
	add_child.call_deferred(summoned_enemy)
