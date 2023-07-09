extends Control

@export var main_scene = preload("res://Scenes/main.tscn")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(event):
	if event is InputEventKey or event is InputEventJoypadButton:
		if event.pressed:
			var scene = main_scene.instantiate()
			get_parent().add_child(scene)
			queue_free()
			
