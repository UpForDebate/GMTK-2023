extends Node

@export var main_menu_scene = preload("res://Scenes/main_menu.tscn")

func _ready():
	var scene = main_menu_scene.instantiate()
	add_child(scene)
