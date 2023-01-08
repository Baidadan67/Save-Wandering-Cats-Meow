extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_Button_button_up():
	get_tree().change_scene("res://Scene/Title/TitleRoom.tscn")
