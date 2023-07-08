extends Node

var is_game_paused

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	is_game_paused = false
	
func _physics_process(delta):
	if Input.is_action_just_pressed("pause"):
		if is_game_paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			$Player.hide()
			is_game_paused = false
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			$Player.show()
			is_game_paused = true
		
