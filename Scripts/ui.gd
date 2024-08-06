extends CanvasLayer

class_name UI

@onready var game_over_menu = $GameOverMenu

func show_game_over():
	game_over_menu.show()
	BackroundMusic.stop()

func _on_button_pressed():
	get_tree().reload_current_scene()
	BackroundMusic.play()


func _on_quit_pressed():
	get_tree().quit()
