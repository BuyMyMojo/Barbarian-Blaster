extends Node3D

@export var projectile: PackedScene

func fire_weapon():
	var new_projectile: Node3D = projectile.instantiate()
	add_child(new_projectile)
	new_projectile.position = position
