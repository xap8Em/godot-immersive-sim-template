extends Node


var _gravity: float
var _level: Level


func _init() -> void:
	_gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func get_gravity() -> float:
	return _gravity


func get_level() -> Level:
	return _level


func set_level(value: Level) -> void:
	_level = value
