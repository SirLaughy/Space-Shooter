class_name ReloadTimer
extends Timer

@export var actor: Turret

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

func _ready() -> void:
	wait_time = actor.turret_stats.reload_time/60
	timeout.connect(_on_timeout)

func _on_timeout():
	if visible_on_screen_notifier_2d.is_on_screen():
		GlobalSignalBus.summon_projectile.emit(actor.projectile, actor.projectile_stats, actor.global_position, actor.get_direction(), actor.turret_stats.summoner_type)
