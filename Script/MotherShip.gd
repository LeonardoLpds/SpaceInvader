extends Area2D

var score = 200

signal destroyed(obj)

func _ready():
	get_node("Animation").play("move")
	yield(get_node("Animation"), "finished")
	queue_free()

func destroy(obj):
	emit_signal("destroyed", self)
	queue_free()