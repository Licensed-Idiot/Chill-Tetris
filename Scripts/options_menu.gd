extends Control
class_name OptionsMenu

signal exit_options_menu

func _ready():
	set_process(false)

func _on_button_pressed():
	exit_options_menu.emit()
	set_process(false)
