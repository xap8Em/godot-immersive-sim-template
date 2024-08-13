extends "res://player_character/states/state.gd"


func unhandled_input(event: InputEvent) -> void:
	super(event)

	if event.is_action_pressed("jump"):
		exiting.emit("jumping")

		return
