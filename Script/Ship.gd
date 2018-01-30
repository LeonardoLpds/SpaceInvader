extends Area2D

const SPEED = 100

var direction = 0

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	direction = 0
	
	if Input.is_action_pressed("ui_right") :
		direction += 1
	if Input.is_action_pressed("ui_left") :
		direction -= 1

	translate(Vector2(1,0) * SPEED * direction * delta)
	
	if get_global_pos().x < 7:
		set_global_pos(Vector2(7, get_global_pos().y))
		
	if get_global_pos().x > 173:
		set_global_pos(Vector2(173, get_global_pos().y))