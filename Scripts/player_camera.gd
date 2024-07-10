class_name PlayerCamera

extends Camera3D

@export var level_grid_map: GridMap
@export var turret_manager: TurretManager

@onready var ray_cast_3d: RayCast3D = $RayCast3D

enum grid_cell_type { EMPTY = 0, TURRET = 1 }


func _process(_delta: float) -> void:
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	ray_cast_3d.target_position = project_local_ray_normal(mouse_position) * 100
	ray_cast_3d.force_raycast_update()

	if ray_cast_3d.is_colliding():
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

		# DEBUG: draw where player is mousing over
		DebugDraw3D.draw_sphere(ray_cast_3d.get_collision_point(), 0.25, Color.RED)

		var collider := ray_cast_3d.get_collider()
		if collider is GridMap:
			if Input.is_action_just_pressed("left_click"):
				var collision_point: Vector3 = ray_cast_3d.get_collision_point()
				var cell := level_grid_map.local_to_map(collision_point)
				
				if level_grid_map.get_cell_item(cell) == grid_cell_type.EMPTY:
					level_grid_map.set_cell_item(cell, grid_cell_type.TURRET)
					
					var tile_position := level_grid_map.map_to_local(cell)
					
					turret_manager.build_turret(tile_position)
	elif Input.get_current_cursor_shape() != Input.CURSOR_ARROW:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
