class_name PlayerBase

extends Node3D

@export var max_health: int = 5

@onready var label_3d: Label3D = $Label3D

var health: int:
	set(health_in):
		health = health_in
		label_3d.text = str(health)
		
		if health < 1:
			get_tree().reload_current_scene()
	get:
		return health

func _ready() -> void:
	health = max_health

func take_damage() -> void:
	health -= 1
