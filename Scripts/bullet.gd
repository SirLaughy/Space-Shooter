extends CharacterBody2D

var fired_by: GlobalEnums.fired_by
var speed: float
var direction: Vector2

func _init() -> void:
	match fired_by:
		GlobalEnums.fired_by.PLAYER:
			set_collision_mask_value(4, true)
		GlobalEnums.fired_by.ENEMY:
			set_collision_mask_value(1, true)

func _physics_process(delta: float) -> void:
	velocity = speed * direction
	var collision = move_and_collide(velocity * delta)
	if collision:
		var colider = collision.get_collider()
		if colider.get_groups().has("Player"):
			GlobalSignalBus.player_died.emit()
		colider.queue_free()
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
