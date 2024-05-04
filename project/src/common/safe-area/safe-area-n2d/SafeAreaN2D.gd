extends Node2D

var safe_area  = DisplayServer.get_display_safe_area()
var window_size = DisplayServer.window_get_size()

func _ready():
	#change_portrait()
	pass

# Portrait mode
func change_portrait():
	var unit_x = window_size.x / 9
	var unit_y = window_size.y / 16
	
	if(unit_x <= unit_y):
		var diff_y = (window_size.y - 16 * unit_x) / 2
		var pos_y = max(diff_y, safe_area.position.y)
		global_position = Vector2(safe_area.position.x, pos_y)
	else:
		var diff_x = (window_size.x - 9 * unit_y) / 2
		var pos_x = max(diff_x, safe_area.position.x)
		global_position = Vector2(pos_x, safe_area.position.y)

# Landscape mode
func change_landscape():
	var unit_x = window_size.x / 16
	var unit_y = window_size.y / 9
	
	if(unit_x <= unit_y):
		var diff_y = (window_size.y - 9 * unit_x) / 2
		var pos_y = max(diff_y, safe_area.position.y)
		global_position = Vector2(safe_area.position.x, pos_y)
	else:
		var diff_x = (window_size.x - 16 * unit_y) / 2
		var pos_x = max(diff_x, safe_area.position.x)
		global_position = Vector2(pos_x, safe_area.position.y)
