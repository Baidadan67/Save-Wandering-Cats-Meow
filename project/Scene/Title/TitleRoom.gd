extends Node2D


export var mainGamesence: PackedScene

func _on_load_button_button_up():
	# print("load a game")
	get_tree().change_scene(mainGamesence.resource_path)

func _on_new_Button_button_up():
	# print("new game")
	get_tree().change_scene(mainGamesence.resource_path)

func _on_Instru_Button_button_up():	
	$Instru.visible = true
	

func _on_quit_button_button_up():
	get_tree().quit()


func _on_Button_return_button_up():
	$Instru.visible = false
