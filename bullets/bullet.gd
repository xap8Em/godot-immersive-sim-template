class_name Bullet
extends Node3D


var _physics_point_query_parameters_3d := PhysicsPointQueryParameters3D.new()
var _velocity: Vector3


func _physics_process(delta: float) -> void:
	_velocity.y -= Globals.get_gravity() * delta

	global_position += _velocity * delta

	var physics_direct_space_state_3d: PhysicsDirectSpaceState3D
	physics_direct_space_state_3d = get_world_3d().get_direct_space_state()

	_physics_point_query_parameters_3d.set_position(global_position)

	var intersection_list: Array[Dictionary]
	intersection_list = physics_direct_space_state_3d.intersect_point(
			_physics_point_query_parameters_3d, 1)

	if intersection_list.is_empty():
		return

	queue_free()


func launch(muzzle_velocity: Vector3) -> void:
	_velocity = muzzle_velocity
