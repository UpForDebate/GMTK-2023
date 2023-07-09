extends CharacterBody3D

var movement_speed: float = 10.0
@export var transformTarget: CharacterBody3D

@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D

@export var game_over_scene = preload("res://Scenes/game_over_yeahhh.tscn")

func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 0.5
	navigation_agent.target_desired_distance = 0.5

	# Make sure to not await during _ready.
	call_deferred("actor_setup")

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	set_movement_target(transformTarget.position)

func set_movement_target(movement_target: Vector3):
	navigation_agent.set_target_position(movement_target)

func _physics_process(delta):
	look_at(transformTarget.position)
	
	if navigation_agent.is_navigation_finished():
		return

	var current_agent_position: Vector3 = global_position
	var next_path_position: Vector3 = navigation_agent.get_next_path_position()

	var new_velocity: Vector3 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * movement_speed

	velocity = new_velocity
	move_and_slide()
	
	for index in range(get_slide_collision_count()):
		var collision = get_slide_collision(index)
		if collision.get_collider().is_in_group("player"):
			var scene = game_over_scene.instantiate()
			get_parent().get_parent().add_child(scene)
			get_parent().queue_free()


func _on_nav_timer_timeout():
	set_movement_target(transformTarget.position)
