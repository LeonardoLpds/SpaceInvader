extends Area2D

const SPEED     = 120
const DIRECTION = Vector2(0, 1)

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	translate(DIRECTION * SPEED * delta)
	if get_global_pos().y > 270:
		destroy(self)

func destroy(obj):
	queue_free()

func _on_enemy_shot_area_enter( area ):
	if area.has_method("destroy"):
		area.destroy(self)
		destroy(self)
