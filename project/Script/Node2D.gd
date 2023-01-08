extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		if Input.is_action_pressed("ui_select"): 
			get_tree().change_scene("res://Scene/Inside/InsideRoom.tscn")
	
	
#func _on_ExitOutdoor_input_event(viewport, event, shape_idx):
	#if (event is InputEventMouseButton && event.pressed):
	#	# print("Clicked")
	#	get_tree().change_scene("res://Scene/Inside/InsideRoom.tscn")
				

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
