extends Control

class_name GameOver

signal restart
signal options
signal quit



func _on_restart_button_pressed():
	restart.emit()


func _on_options_button_pressed():
	options.emit()


func _on_quit_pressed():
	quit.emit()
