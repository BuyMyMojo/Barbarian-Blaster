class_name TurretManager

extends Node3D

@export var turret_scene: PackedScene

func build_turret(spawn_location: Vector3) -> void:
	var new_turret := turret_scene.instantiate()
	new_turret.global_position = spawn_location
	add_child(new_turret)
