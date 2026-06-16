extends CanvasLayer

@onready var button_left: Button = $button_left
@onready var button_right: Button = $button_right

func _on_button_left_button_down() -> void:
	GlobalSignalBus.player_move.emit(GlobalEnums.direction.LEFT)


func _on_button_right_button_down() -> void:
	GlobalSignalBus.player_move.emit(GlobalEnums.direction.RIGHT)


func _on_button_left_button_up() -> void:
	GlobalSignalBus.player_move.emit(GlobalEnums.direction.NIL)


func _on_button_right_button_up() -> void:
	GlobalSignalBus.player_move.emit(GlobalEnums.direction.NIL)
