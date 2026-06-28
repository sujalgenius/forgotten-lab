extends Panel

func _ready():
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.635, 0.809, 0.494, 1.0)
	style.border_width_top = 2
	style.border_color = Color(0.917, 0.757, 0.961, 1.0)
	add_theme_color_override("panel", style)
	hide()
