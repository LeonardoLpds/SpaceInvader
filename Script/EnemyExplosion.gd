extends Node2D

func _ready():
	get_node("Animation").play("Explode")
	yield(get_node("Animation"), "finished")
	queue_free()
