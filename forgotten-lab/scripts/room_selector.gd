extends Panel

func _ready():
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.589, 0.617, 0.589, 1.0)
	style.border_width_left = 2
	style.border_width_right = 2
	style.border_width_top = 2
	style.border_width_bottom = 2
	style.border_color = Color(0.5, 0.5, 1.0)
	add_theme_stylebox_override("panel", style)
	
	# Position and size the panel in the centre of the screen
	custom_minimum_size = Vector2(300,200)
	set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	
	# Connect the RoomSelector Buttons (The Rooms)
	$BtnNeuroLab.text = "Neuroscience Lab"
	$BtnRobotLab.text = "Robot Lab"
	$BtnCompLab.text = "Computer Lab"
	$BtnMainOffice.text = "Main Office"
	
	$BtnNeuroLab.pressed.connect(_on_neuro_pressed)
	$BtnRobotLab.pressed.connect(_on_robot_pressed)
	$BtnCompLab.pressed.connect(_on_computer_pressed)
	$BtnMainOffice.pressed.connect(_on_main_office_pressed)
	
	hide()

func show_menu():
	# Re-enable player movement lock
	var player = get_tree().root.get_node("Game/CharacterBody2D")
	player.can_move = false
	show()

func _on_neuro_pressed():
	print("Going to Neuroscience Lab!")
	hide_menu()

func _on_robot_pressed():
	print("Going to Robot Lab!")
	hide_menu()

func _on_computer_pressed():
	print("Going to Computer Lab!")
	hide_menu()

func _on_main_office_pressed():
	print("Going to Main Office!")
	hide_menu()

func hide_menu():
	var player = get_tree().root.get_node("Game/CharacterBody2D")
	player.can_move = true
	hide()
	
