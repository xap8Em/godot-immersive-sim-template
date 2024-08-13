extends "res://player_character/states/in_air/in_air.gd"


func enter() -> void:
	super()

	_player_character.apply_jump_velocity()


func physics_process(delta: float) -> void:
	super(delta)

	if _player_character.get_real_velocity().y < 0.0:
		exiting.emit("falling")

		return
