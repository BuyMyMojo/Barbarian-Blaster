class_name BaseEnemy

extends PathFollow3D

## Speed in m/s
@export_range(0, 100) var speed: float = 6
@export var max_health: int = 50

@onready var base: PlayerBase = get_tree().get_first_node_in_group("Base")

var current_health: int:
	set(health_in):
		current_health = health_in
		if current_health <= 0:
			die()


func _ready() -> void:
	current_health = max_health


func _process(delta: float) -> void:
	progress += speed * delta

	if progress_ratio >= 1.0:
		base.take_damage()
		#queue_free()
		set_process(false)


# Made into seperate function in case I want to add a score system or something™️
func die() -> void:
	queue_free()
