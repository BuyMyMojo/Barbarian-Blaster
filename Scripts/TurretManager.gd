class_name TurretManager

extends Node3D

@export var turret_scene: PackedScene

@export var enemy_path: Path3D

func build_turret(spawn_location: Vector3) -> void:
	var new_turret: BaseTurret = turret_scene.instantiate()
	new_turret.global_position = spawn_location
	new_turret.enemy_path = enemy_path
	add_child(new_turret)
