class_name Pistol
extends Node3D


var _bullet_packed_scene: PackedScene
var _muzzle_velocity: float = 100.0

@onready var _muzzle: Node3D = $Muzzle


func _init() -> void:
	_bullet_packed_scene = preload("res://bullets/bullet.tscn")

	assert(_bullet_packed_scene)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		var bullet: Bullet = _bullet_packed_scene.instantiate()

		assert(bullet)

		Globals.get_level().add_child(bullet)

		bullet.set_global_position(_muzzle.get_global_position())

		bullet.launch(-_muzzle.get_global_basis().z * _muzzle_velocity)
