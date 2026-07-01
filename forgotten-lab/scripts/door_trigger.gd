extends Area2D

var room_selector

func _ready():
	body_entered.connect(_on_body_entered)
	room_selector = get_node("/root/Game/DialogueUI/RoomSelector")
	print("Door Trigger ready, room_selector: ", room_selector)

func _on_body_entered(body):
	print("Something entered door_trigger: ", body.name)
	if body.name == "CharacterBody2D":
		room_selector.show_menu()
