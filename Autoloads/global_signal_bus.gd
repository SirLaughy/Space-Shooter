extends Node

# Player Signals
signal player_died

# Bullet Signals
signal summon_projectile(scene, projectile_stats: ProjectileStats, location: Vector2, direction: Vector2, summoner_group: GlobalEnums.group_types)
signal summon_entity()

# Enemy Signals
signal summon_enemy()
