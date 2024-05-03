extends MarginContainer

var safe_area  = DisplayServer.get_display_safe_area()
var window_size = get_window().get_size_with_decorations()

func _ready():
	var unit_x = window_size.x / 9
	var unit_y = window_size.y / 16
	
	if(unit_x <= unit_y):
		var diff_y = (window_size.y - 16 * unit_x) / 2
		var pos_y = max(diff_y, safe_area.position.y)
		add_theme_constant_override("offset_top", pos_y)
		add_theme_constant_override("offset_left", safe_area.position.x)
	else:
		var diff_x = (window_size.x - 9 * unit_y) / 2
		var pos_x = max(diff_x, safe_area.position.x)
		add_theme_constant_override("offset_top", safe_area.position.y)
		add_theme_constant_override("offset_left", pos_x)
