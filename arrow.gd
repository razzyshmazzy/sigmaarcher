extends Area2D

const ARROW_SPEED = 600.0
const GRAVITY = 100.0 

var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	velocity = transform.x * ARROW_SPEED
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("balloons"):
		area.remove_from_group("balloons")
		Global.update_score(1)
		area.queue_free()
		queue_free()

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	rotation = velocity.angle()
	position += velocity * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
