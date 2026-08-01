extends Node

# Player Signals
signal entity_died(entity: Entity)

# Bullet Signals
signal summon_projectile(scene, projectile_stats: ProjectileStats, location: Vector2, angle: float, summoner_type: GlobalEnums.group_types)
signal summon_entity(scene: PackedScene, location: Vector2)

# Enemy Signals
signal summon_enemy()
signal drops_dropped(money: float, items: Array)
