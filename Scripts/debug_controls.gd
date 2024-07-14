extends Node


func _process(_delta: float) -> void:
	if Input.is_physical_key_pressed(KEY_ESCAPE):
		get_tree().quit()

	if Input.is_physical_key_pressed(KEY_R):
		get_tree().reload_current_scene()
