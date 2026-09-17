extends Area2D


func _ready() -> void:
	add_to_group("balloons")
	
	global_position.x = 700 + randi_range(-100, 100) 
	global_position.y = 300 + randi_range(-70, 70) 


func _process(delta: float) -> void:
	pass

	
