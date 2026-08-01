class_name ReloadTimer
extends Timer

@export var actor: Turret


func _ready() -> void:
	wait_time = actor.turret_stats.reload_time/60
	timeout.connect(_on_timeout)

func _on_timeout():
	GlobalSignalBus.summon_projectile.emit(actor.projectile, actor.projectile_stats, actor.get_global_position(), actor.global_rotation, actor.turret_stats.summoner_type)
