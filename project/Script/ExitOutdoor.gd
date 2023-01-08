extends Area2D

func _ready():
	pass 

func _on_ExitOutdoor_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		# print("Clicked")
		get_tree().change_scene("res://Scene/Inside/InsideRoom.tscn")
