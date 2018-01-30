extends Node2D

const SPEED          = Vector2(6, 0)
const MAX_TIME       = 0.1
const VERTICAL_SPEED = Vector2(0, 8)
const ACCELERATION   = 0.1

var pre_shot  = preload("res://Instances/EnemyShot.tscn")
var direction = 1

func _ready():
	get_node("TimerShot").start()
	
func shoot():
	var enemies_count = get_node("Enemies").get_child_count()
	var enemy         = get_node("Enemies").get_child(randi() % enemies_count)
	var shot          = pre_shot.instance()
	
	get_parent().add_child(shot)
	shot.set_global_pos(enemy.get_global_pos())

func _on_timer_shot_timeout():
	get_node("TimerShot").set_wait_time(rand_range(0.5, 2))
	shoot()

func _on_timer_move_timeout():
	var on_border = false
	
	for enemy in get_node("Enemies").get_children():
		enemy.next_frame()
		
		if enemy.get_global_pos().x > 170 and direction > 0:
			direction = -1
			on_border = true
		if enemy.get_global_pos().x < 10 and direction < 0:
			direction = 1
			on_border = true
	
	if on_border:
		translate(VERTICAL_SPEED)
		var time = get_node("TimerMove").get_wait_time()
		if time > MAX_TIME:
			get_node("TimerMove").set_wait_time(time - ACCELERATION)
	else:
		translate(SPEED * direction)
