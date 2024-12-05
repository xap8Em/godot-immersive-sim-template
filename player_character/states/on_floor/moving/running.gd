extends "res://player_character/states/on_floor/moving/moving.gd"


func enter() -> void:
	super()

	_player_character.set_max_movement_speed(_player_character.MAX_RUNNING_SPEED)


func physics_process(delta: float) -> void:
	super(delta)

	if Input.is_action_pressed("sprint"):
		exiting.emit("sprinting")

		return
