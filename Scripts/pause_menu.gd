extends Control

var _is_paused: bool = false:
	set = show_pause_menu

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_is_paused = !_is_paused

func show_pause_menu(value: bool) -> void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused


func _on_resume_button_pressed():
	_is_paused = false


func _on_restart_button_pressed():
	_is_paused = false
	get_tree().reload_current_scene()
	BackroundMusic.play()


func _on_quit_button_pressed():
	get_tree().quit()
