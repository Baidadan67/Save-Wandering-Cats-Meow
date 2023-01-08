extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var indoors = load("res://Scene/Inside/InsideRoom.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.get_action_strength("ui_select"):
		var indoor = indoors.instance()
		add_child(indoor)
#func _on_ExitOutdoor_input_event(viewport, event, shape_idx):
	#if (event is InputEventMouseButton && event.pressed):
	#	# print("Clicked")
	#	get_tree().change_scene("res://Scene/Inside/InsideRoom.tscn")
				

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
