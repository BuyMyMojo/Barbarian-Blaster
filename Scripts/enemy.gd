extends PathFollow3D

## Speed in m/s
@export_range(0, 100) var speed: float = 6

@onready var base: PlayerBase = get_tree().get_first_node_in_group("Base")

func _process(delta: float) -> void:
	progress += speed * delta
	
	if progress_ratio >= 1:
		base.take_damage()
		queue_free()

