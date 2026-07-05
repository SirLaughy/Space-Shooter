extends Node

# Player Signals
signal player_died

# Bullet Signals
signal summon_projectile(scene, projectile_stats: ProjectileStats, location: Vector2, angle: float, summoner_type: GlobalEnums.group_types)
signal summon_entity()

# Enemy Signals
signal summon_enemy()
