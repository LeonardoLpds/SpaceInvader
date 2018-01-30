tool
extends Node2D

export(Texture) var texture
export(int)     var lifes = 3 setget set_lifes

func _ready():
	pass

func _draw():
	for life in range(lifes):
		draw_texture_rect_region(texture, Rect2(life * 16,0,15,8), Rect2(0,0,15,8))
		
func set_lifes(value):
	lifes = value
	update()