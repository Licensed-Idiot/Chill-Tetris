extends Control
class_name HotkeyRebindButton

@onready var label = $VBoxContainer/Label as Label
@onready var button = $VBoxContainer/Button as Button

@export var action_name: String = "Unasigned"

func _ready():
	set_process_unhandled_input(false)
	set_action_name()
	set_text_for_key()

func set_action_name() -> void:
	label.text = " ".join(action_name.split("_")).capitalize()

func set_text_for_key() -> void:
	var action_events = InputMap.action_get_events(action_name)
	if action_events.size() > 0:
		var action_event = action_events[0]
		if action_event is InputEventKey:
			var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
			button.text = "%s" % action_keycode
		elif action_event is InputEventJoypadButton:
			var action_button_index = action_event.button_index
			button.text = "Button %s" % action_button_index
		elif action_event is InputEventJoypadMotion:
			var action_axis = action_event.axis
			button.text = "Axis %s" % action_axis

func _on_button_toggled(button_pressed):
	if button_pressed:
		button.text = "Press any key..."
		set_process_unhandled_input(button_pressed)
		
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = false
				i.set_process_unhandled_input(false)
		
	else:
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = true
				i.set_process_unhandled_input(false)
			
		set_text_for_key()

func _unhandled_input(event: InputEvent) -> void:
	rebind_action_key(event)
	button.button_pressed = false

func rebind_action_key(event):
	#var is_duplicate = false
	var action_event = event
	#var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
	#for i in get_tree().get_nodes_in_group("hotkey_button"):
		#if i.action_name != self.action_name:
			#if i.button.text == "%s" %action_keycode:
				#is_duplicate = true
				#self.button.text = "'" + action_keycode + "' already bound"
				#await get_tree().create_timer(2.0).timeout
				#set_process_unhandled_input(false)
				#set_text_for_key()
				#break
	#if not is_duplicate:
	InputMap.action_erase_events(action_name)
	InputMap.action_add_event(action_name,event)
	set_process_unhandled_input(false)
	set_text_for_key()
	set_action_name()
