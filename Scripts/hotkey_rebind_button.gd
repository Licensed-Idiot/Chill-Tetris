extends Control
class_name HotkeyRebindButton

@onready var label = $VBoxContainer/Label as Label
@onready var button = $VBoxContainer/Button as Button

@export var action_name: String = "left"

func _ready():
	set_process_unhandled_input(false)
	set_action_name()
	set_text_for_key()

func set_action_name() -> void:
	label.text = "Unasigned"
	
	match action_name:
		"left":
			label.text = "Move Left"
		"right":
			label.text = "Move Right"
		"down":
			label.text = "Move Down"
		"hard_drop":
			label.text = "Brick Drop"
		"rotate_left":
			label.text = "Rotate Left"
		"rotate_right":
			label.text = "Rotate Right"

func set_text_for_key() -> void:
	var action_events = InputMap.action_get_events(action_name)
	var action_event = action_events[0]
	var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
	
	button.text = "%s" % action_keycode





func _on_button_toggled(button_pressed):
	if button_pressed:
		button.text = "Press any key..."
		set_process_unhandled_input(button_pressed)
	else:
		set_text_for_key()
