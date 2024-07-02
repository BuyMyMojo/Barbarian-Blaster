extends PathFollow3D

## Speed in m/s
@export_range(0, 100) var speed: float = 6

func _process(delta: float) -> void:
	progress += speed * delta
