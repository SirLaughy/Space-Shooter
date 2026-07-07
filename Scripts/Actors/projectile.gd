class_name Projectile
extends Entity

@export var hurt_box: HurtBox

var projectile_stats: ProjectileStats
var direction: Vector2
var summoner_type: GlobalEnums.group_types

func _ready() -> void:
	modulate = projectile_stats.colour
	hurt_box.damage = projectile_stats.damage
	match summoner_type:
		GlobalEnums.group_types.PLAYER:
			hurt_box.set_collision_mask_value(4, true)
		GlobalEnums.group_types.DESTRUCTIBLES:
			hurt_box.set_collision_mask_value(1, true)

func _process(delta: float) -> void:
	var temp_dir = Vector2.from_angle(global_rotation).normalized()
	direction = Vector2(temp_dir.y * -1, temp_dir.x * -1)
