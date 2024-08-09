extends CanvasLayer

class_name UI

@onready var game_over_menu = $GameOverMenu as GameOver
@onready var panel_container = $GameOverMenu/PanelContainer
@onready var options_menu = $GameOverMenu/OptionsMenu as OptionsMenu

func show_game_over():
	game_over_menu.show()
	BackroundMusic.stop()

func _on_button_pressed():
	get_tree().reload_current_scene()
	BackroundMusic.play()

func _on_options_button_pressed():
	panel_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true

func _on_options_menu_exit_options_menu():
	panel_container.visible = true
	options_menu.visible = false

func _on_quit_pressed():
	get_tree().quit()

