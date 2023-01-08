extends StaticBody2D






var dropcat = false

func _on_hurtbox_body_entered(body: PhysicsBody2D):
	if body.name == "player":
		print("collide and option")
		dropcat = true

func _on_hurtbox_body_exited(body):
	dropcat = false
	
func _process(delta):
	if dropcat == true:
		if Input.is_action_just_pressed("ui_select"):
			print("u through this cat out.")
			get_tree().change_scene("res://Scene/Outside/OutsideRoom.tscn")
	
