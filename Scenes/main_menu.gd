extends Control

@export var main_scene = preload("res://Scenes/main.tscn")

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			var scene = main_scene.instantiate()
			get_parent().add_child(scene)
			queue_free()
			
