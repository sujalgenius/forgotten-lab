extends Area2D

var player_nearby = false
var dialogue_box

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	dialogue_box = get_tree().root.find_child("DialogueBox", true, false)
	print("DialogueBox found: ", dialogue_box)
	
func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		player_nearby = true
		print("Player is nearby. Press E to talk!")
	
func _on_body_exited(body):
	if body.name == "CharacterBody2D":
		player_nearby = false
		print("Player walked away.")
		if dialogue_box:
			dialogue_box.hide()
		var player = get_node("/root/Game/CharacterBody2D")
		player.can_move = true

func _process(delta):
	if player_nearby and Input.is_action_just_pressed("ui_accept"):
		if dialogue_box and not dialogue_box.visible:
			var player = get_node("/root/Game/CharacterBody2D")
			player.can_move = false
			dialogue_box.start_dialogue(
				"Dr. Watermelon",
				[
				"Oh, good morning dear intern! Welcome to your first day!",
				"You see... I have no idea where I kept my stuff.",
				"Could you help me find them?",
				"Talk to the other scientists first! They might know where to start!"
				]
			)
