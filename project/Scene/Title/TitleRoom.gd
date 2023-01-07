extends Node2D


export var mainGamesence: PackedScene

func _on_load_button_button_up():
	print("load a game")

func _on_new_Button_button_up():
	get_tree().change_scene(mainGamesence.resource_path)

func _on_Instru_Button_button_up():
	print("show instruction")

func _on_quit_button_button_up():
	get_tree().quit()
