extends StateMachine


func _init(player_character: PlayerCharacter) -> void:
	_add_state(&"falling",
			preload("res://player_character/states/in_air/falling.gd").new(player_character))
	_add_state(&"jumping",
			preload("res://player_character/states/in_air/jumping.gd").new(player_character))
	_add_state(&"idle",
			preload("res://player_character/states/on_floor/idle.gd").new(player_character))
	_add_state(&"running",
			preload("res://player_character/states/on_floor/moving/running.gd").new(player_character))
	_add_state(&"sprinting",
			preload("res://player_character/states/on_floor/moving/sprinting.gd").new(player_character))

	super(&"idle")
