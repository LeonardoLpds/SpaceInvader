tool
extends Area2D

export(int, "A", "B", "C") var type = 0 setget set_type

var score      = 0
var frame      = 0

var attributes = [
	{
		texture = preload("res://Sprites/InvaderA_sheet.png"),
		score   = 10
	},
	{
		texture = preload("res://Sprites/InvaderB_sheet.png"),
		score   = 20
	},
	{
		texture = preload("res://Sprites/InvaderC_sheet.png"),
		score   = 30
	}
]

func _ready():
	pass
	
func _draw():
	var attribute = attributes[type]
	get_node("Sprite").set_texture(attribute.texture)
	score = attribute.score

func set_type(value):
	type = value
	if is_inside_tree() and get_tree().is_editor_hint():
		update()

func next_frame():
	if frame == 0:
		frame = 1
	else:
		frame = 0
		
	get_node("Sprite").set_frame(frame)

func destroy(obj):
	queue_free()
