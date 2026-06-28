extends Area2D

var player_nearby = false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		player_nearby = true
		print("Player is nearby. Press E to talk!")
	
func _on_body_exited(body):
	if body.name == "CharacterBody2D":
		player_nearby = false
		print("Player walked away.")

func _process(delta):
	if player_nearby and Input.is_action_just_pressed("ui_accept"):
		print("Hello! I'm a scientist and I have no idea where I kept my stuff!")
