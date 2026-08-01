extends Label

@export var health_component: Health

func _process(delta: float) -> void:
	text = str(health_component.health)
