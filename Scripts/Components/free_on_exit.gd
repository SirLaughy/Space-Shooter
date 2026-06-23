class_name FreeOnExit
extends VisibleOnScreenNotifier2D

@export var actor: Entity

func _ready() -> void:
	screen_exited.connect(_on_screen_exited)

func _on_screen_exited():
	actor.queue_free()
