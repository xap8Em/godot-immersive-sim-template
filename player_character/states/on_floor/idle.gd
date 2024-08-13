extends "res://player_character/states/on_floor/on_floor.gd"


func physics_process(delta: float) -> void:
	super(delta)

	if not _player_character.get_input_movement_vector().is_zero_approx():
		if Input.is_action_pressed("sprint"):
			exiting.emit("sprinting")

			return

		exiting.emit("running")

		return
