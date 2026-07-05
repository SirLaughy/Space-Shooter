extends Label

@export var actor: Entity

func _process(delta: float) -> void:
	text = str(actor.velocity) + " | " + str(actor.projectile_stats.speed * delta)
