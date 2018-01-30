extends Node

var score = 0

func _ready():
	update_score()
	get_node("EnemyGroup").connect("enemy_down", self, "on_enemy_group_enemy_down")

func on_enemy_group_enemy_down(enemy):
	score += enemy.score
	update_score()
	
func update_score():
	get_node("HUD/Score").set_text(str(score))