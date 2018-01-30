extends Area2D

const SPEED     = 150
const DIRECTION = Vector2(0, -1)

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	translate(DIRECTION * SPEED * delta)
	
	if get_global_pos().y < 0:
		queue_free()
