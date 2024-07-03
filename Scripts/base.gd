class_name PlayerBase

extends Node3D

@export var max_health: int = 5

@onready var label_3d: Label3D = $Label3D

var health: int

func _ready() -> void:
	label_3d.text = str(max_health)
	health = max_health

func take_damage() -> void:
	Log.log("Base damaged")
	health -= 1
	update_health()

func update_health() -> void:
	label_3d.text = str(health)
