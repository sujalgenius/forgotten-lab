extends Panel

var lines = []
var current_line = 0
var full_text = ""
var displayed_text = ""
var char_index = 0
var typing_speed = 0.05
var timer = 0.0
var is_typing = false
var just_opened = false

func _ready():
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.635, 0.809, 0.494, 1.0)
	style.border_width_top = 2
	style.border_color = Color(0.917, 0.757, 0.961, 1.0)
	add_theme_stylebox_override("panel", style)
	hide()
	
func start_dialogue(speaker_name, dialogue_lines):
	lines = dialogue_lines
	current_line = 0
	$NameLabel.text = speaker_name
	just_opened = true
	show()
	show_line(0)

func show_line(index):
	full_text = lines[index]
	displayed_text = ""
	char_index = 0
	is_typing = true
	$DialogueText.text = ""

func _process(delta):
	
	if just_opened:
		just_opened = false
		return
	
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
				
	if Input.is_action_just_pressed("ui_accept"):
		if is_typing:
			# skip the typewriter, show full line instantly
			displayed_text = full_text
			$DialogueText.text = displayed_text
			char_index = full_text.length()
			is_typing = false
		elif current_line < lines.size() - 1:
			# go to next line
			current_line += 1
			show_line(current_line)
		else:
			# end dialogue
			hide()
			var player = get_tree().root.get_node("/root/Game/CharacterBody2D")
			player.can_move = true
			
