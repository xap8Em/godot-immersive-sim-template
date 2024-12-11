class_name Pistol
extends Node3D


enum State {
	STATE_FIRING,
	STATE_IDLE,
	STATE_RELOADING,
}

var _bullet_packed_scene: PackedScene
var _loaded_ammunition_count: int
var _magazine_capacity: int = 8
var _muzzle_velocity: float = 100.0
var _state: State

@onready var _muzzle: Node3D = $Muzzle


func _init() -> void:
	_bullet_packed_scene = preload("res://bullets/bullet.tscn")

	assert(_bullet_packed_scene)

	_loaded_ammunition_count = _magazine_capacity

	DebugMenu.set_info_value("pistol/loaded_ammunition_count",
			_loaded_ammunition_count)

	DebugMenu.set_info_value("pistol/magazine_capacity", _magazine_capacity)

	_state = State.STATE_IDLE

	DebugMenu.set_info_value("pistol/state", "idle")


func _unhandled_input(event: InputEvent) -> void:
	if _state == State.STATE_IDLE:
		if (
				event.is_action_pressed("reload")
				and _loaded_ammunition_count < _magazine_capacity
		):
			_reload()

			return

		if event.is_action_pressed("shoot"):
			if _loaded_ammunition_count == 0:
				_reload()

				return

			_state = State.STATE_FIRING

			DebugMenu.set_info_value("pistol/state", "firing")

			var bullet: Bullet = _bullet_packed_scene.instantiate()

			assert(bullet)

			Globals.get_level().add_child(bullet)

			bullet.set_global_position(_muzzle.get_global_position())

			bullet.launch(-_muzzle.get_global_basis().z * _muzzle_velocity)

			_loaded_ammunition_count -= 1

			DebugMenu.set_info_value("pistol/loaded_ammunition_count",
					_loaded_ammunition_count)

			_state = State.STATE_IDLE

			DebugMenu.set_info_value("pistol/state", "idle")

			return


func _reload() -> void:
	_state = State.STATE_RELOADING

	DebugMenu.set_info_value("pistol/state", "reloading")

	_loaded_ammunition_count = _magazine_capacity

	DebugMenu.set_info_value("pistol/loaded_ammunition_count",
			_loaded_ammunition_count)

	_state = State.STATE_IDLE

	DebugMenu.set_info_value("pistol/state", "idle")
