extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# link 

# Called when the node enters the scene tree for the first time.
var change_scene = false

func _on_hurtbox_body_entered(body: PhysicsBody2D):
	if body.name == "player":
		change_scene = true
		print("collide")

func _on_hurtbox_body_exited(body):
	change_scene = false
	
func _process(delta):
	if change_scene == true:
		if Input.is_action_just_pressed("ui_select"):
			get_tree().change_scene("res://Scene/Outside/OutsideRoom.tscn")
