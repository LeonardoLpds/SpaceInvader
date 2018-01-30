extends Area2D

const SPEED = 100

var direction = 0
var pre_shot  = preload("res://Instances/ShipShot.tscn")
var shooting  = false
var alive     = true

signal destroyed
signal respawn

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var move_right = Input.is_action_pressed("ui_right")
	var move_left  = Input.is_action_pressed("ui_left")
	var shoot      = Input.is_action_pressed("ui_up")
	
	direction = 0
	if move_right :
		direction += 1
	if move_left :
		direction -= 1
	translate(Vector2(1,0) * SPEED * direction * delta)
	
	if get_global_pos().x < 7:
		set_global_pos(Vector2(7, get_global_pos().y))

	if get_global_pos().x > 173:
		set_global_pos(Vector2(173, get_global_pos().y))

	if shoot and not shooting and get_tree().get_nodes_in_group("ship_shot").size() == 0:
		var shot = pre_shot.instance()
		get_parent().add_child(shot)
		shot.set_global_pos(get_global_pos())

	shooting = shoot
	
func destroy(obj):
	if alive:
		alive = false
		set_fixed_process(false)
		
		emit_signal("destroyed")
		get_node("Animation").play("explode")
		yield(get_node("Animation"), "finished")
		
		emit_signal("respawn")
		set_fixed_process(true)
		alive = true
		get_node("Sprite").set_frame(0)
		
