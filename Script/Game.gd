extends Node

var score = 0

var lifes = 3

func _ready():
	randomize()
	update_score()
	get_node("EnemyGroup").connect("enemy_down", self, "on_enemy_group_enemy_down")
	get_node("Ship").connect("destroyed", self, "on_ship_destroyed")
	get_node("Ship").connect("respawn", self, "on_ship_respawn")
	

func on_enemy_group_enemy_down(enemy):
	score += enemy.score
	update_score()
	
func update_score():
	get_node("HUD/Score").set_text(str(score))
	
func on_ship_destroyed():
	lifes -= 1
	get_node("EnemyGroup").stop_all()
	get_node("HUD/Life").set_lifes(lifes)
	
func on_ship_respawn():
	get_node("EnemyGroup").start_all()