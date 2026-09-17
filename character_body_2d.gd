extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var lookingUp: bool = false
var lookingDown: bool = false

const ROTATION_SPEED = 90.0 

@onready var arrow_scene = preload("res://arrow.tscn")
@onready var balloon_scene = preload("res://balloon.tscn")

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("down"):
		lookingDown = true
	elif Input.is_action_just_released("down"):
		lookingDown = false
		
	if Input.is_action_pressed("up"):
		lookingUp = true
	elif Input.is_action_just_released("up"):
		lookingUp = false
		
	if lookingDown:
		rotation_degrees += ROTATION_SPEED * delta
	elif lookingUp:
		rotation_degrees -= ROTATION_SPEED * delta
	
	var balloon_count = get_tree().get_nodes_in_group("balloons").size()
	if balloon_count == 0:
		make_balloon()

	if Input.is_action_just_pressed("shoot"):
		shoot_arrow()

func make_balloon() -> void:
	var balloon_instance = balloon_scene.instantiate()
	balloon_instance.add_to_group("balloons")
	get_tree().current_scene.add_child(balloon_instance)

func shoot_arrow() -> void:
	var arrow_instance = arrow_scene.instantiate()
	arrow_instance.global_position = global_position
	arrow_instance.global_rotation = global_rotation
	get_tree().current_scene.add_child(arrow_instance)
