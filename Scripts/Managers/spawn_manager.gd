extends Node2D

### BUILT-IN FUNCTIONS

func _ready() -> void:
	GlobalSignalBus.summon_projectile.connect(_on_summon_projectile)
	GlobalSignalBus.summon_enemy.connect(_on_summon_enemy)

### CUSTOM SIGNALS

# summons the given projectile at the given locatio facing the same way as the turret that fired it and set the group to ignore collision for to disable friendly fire
func _on_summon_projectile(scene, projectile_stats: ProjectileStats, location: Vector2, angle: float, summoner_type: GlobalEnums.group_types) -> void:
	var summoned_projectile = scene.instantiate()
	summoned_projectile.projectile_stats = projectile_stats
	summoned_projectile.position = location
	summoned_projectile.rotation = angle
	summoned_projectile.summoner_type = summoner_type
	add_child.call_deferred(summoned_projectile)

# summons the given entity at the given location
func _on_summon_enemy(scene: PackedScene, location: Vector2) -> void:
	var summoned_enemy = scene.instantiate()
	summoned_enemy.position = location
	print(str(summoned_enemy.name) + " summoned | " + str(location))
	add_child.call_deferred(summoned_enemy)
