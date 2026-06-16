extends Node

# Player Signals
signal player_move(player_direction: GlobalEnums.direction)
signal player_died

# Bullet Signals
signal shoot(bullet, direction: Vector2, bullet_speed: float, location: Vector2, fired_by: GlobalEnums.fired_by)
signal shot_enemy()

# Enemy Signals
signal summon_enemy(enemy, location: Vector2, movement_type: GlobalEnums.movement_type, attack_type: GlobalEnums.attack_type, horizontal_speed: float, firing_rate: float, bullet_speed: float, vertical_speed: float)
