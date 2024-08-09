extends Control

@onready var options_menu = $OptionsMenu as OptionsMenu
@onready var game_over_menu = $"../GameOverMenu" as GameOver
@onready var panel_container = $PanelContainer as PanelContainer

var _is_paused: bool = false:
	set = show_pause_menu

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if panel_container.visible == false:
			panel_container.visible = true
			options_menu.visible = false
		_is_paused = !_is_paused

func show_pause_menu(value: bool) -> void:
	if game_over_menu.visible == true:
		pass
	else:
		_is_paused = value
		get_tree().paused = _is_paused
		visible = _is_paused

func _on_resume_button_pressed():
	_is_paused = false

func _on_options_pressed():
	panel_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true

func _on_restart_button_pressed():
	_is_paused = false
	get_tree().reload_current_scene()
	BackroundMusic.play()


func _on_quit_button_pressed():
	get_tree().quit()


func _on_options_menu_exit_options_menu():
	panel_container.visible = true
	options_menu.visible = false
