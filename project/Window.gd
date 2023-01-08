extends StaticBody2D

var dropcat = false

func _on_hurtbox_body_entered(body):
	if Input.is_action_just_pressed("ui_select"):
			
