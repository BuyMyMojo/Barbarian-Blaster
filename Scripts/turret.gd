extends Node3D

@export var projectile: PackedScene

@onready var fire_point: Marker3D = $TurretBase/TurretTop/LauncherHolder/Axel/FirePoint

var projectiles_fired: int = 0


func fire_weapon() -> void:
	var new_projectile: Node3D = projectile.instantiate()
	add_child(new_projectile)
	new_projectile.global_position = fire_point.global_position


func _on_fire_timer_timeout() -> void:
	fire_weapon()
	projectiles_fired += 1
