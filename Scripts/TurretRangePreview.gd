@tool

extends Node3D

@export var turret: BaseTurret

#func _process(delta: float) -> void:
	#DebugDraw3D.draw_cylinder_ab(turret.global_position, turret.global_position + (Vector3.UP * 2), turret.range, Color.AQUA)
	
	#(turret.global_position, turret.range, Color.AQUA)
