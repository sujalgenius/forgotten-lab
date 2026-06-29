extends Panel

var full_text = ""
var displayed_text = ""
var char_index = 0
var typing_speed = 0.05
var timer = 0.0
var is_typing = false

func _ready():
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.635, 0.809, 0.494, 1.0)
	style.border_width_top = 2
	style.border_color = Color(0.917, 0.757, 0.961, 1.0)
	add_theme_stylebox_override("panel", style)
	hide()
	
func start_dialogue(speaker_name, text):
	$NameLabel.text = speaker_name
	full_text = text
	displayed_text = ""
	char_index = 0
	is_typing = true
	show()

func _process(delta):
	if is_typing:
		timer += delta
		if timer >= typing_speed:
			timer = 0.0
			if char_index < full_text.length():
				displayed_text += full_text[char_index]
				$DialogueText.text = displayed_text
				char_index += 1
			else:
				is_typing = false
	if not is_typing and visible:
		if Input.is_action_just_pressed("ui_accept"):
			hide()
			var player = get_tree().root.get_node("/root/Game/CharacterBody2D")
			player.can_move = true
			
