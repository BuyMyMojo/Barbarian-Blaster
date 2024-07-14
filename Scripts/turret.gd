class_name BaseTurret

extends Node3D

@export var target_range: float = 15
@export var projectile: PackedScene

@onready var fire_point: Marker3D = $TurretBase/TurretTop/LauncherHolder/Axel/FirePoint
@onready var fire_timer: Timer = $FireTimer

var enemy_path: Path3D

var projectiles_fired: int = 0


func _physics_process(_delta: float) -> void:
	#var enemies = enemy_path.get_children()
	var enemy: Node3D = enemy_path.get_children().back()
	
	if enemy is BaseEnemy:
		if global_position.distance_to(enemy.global_position) <= target_range:
			look_at(enemy.global_position, Vector3.UP, true)
			if fire_timer.is_stopped() == true:
				fire_timer.start()
	else:
		if fire_timer.is_stopped() == false:
			fire_timer.stop()


func fire_weapon() -> void:
	var new_projectile: Node3D = projectile.instantiate()
	add_child(new_projectile)
	new_projectile.global_position = fire_point.global_position
	new_projectile.direction = global_basis.z


func _on_fire_timer_timeout() -> void:
	fire_weapon()
	projectiles_fired += 1
