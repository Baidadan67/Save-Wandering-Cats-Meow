extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 300
const FRICTION = 500
var velocity = Vector2.ZERO
var times = 0
var pro = [0.3, 0.5, 1]
var capture = false
var counter = 50 

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") -  Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") -  Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity. move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)

	for i in get_slide_count():
			var collision = get_slide_collision(i)
			# print(collision.collider.name) 
			if collision.collider.name == "Cat" and counter == 50: 
				if Input.get_action_strength("ui_accept"): 
					if randf() <= pro[times]: 
						print("caputure")
					else:
						print("fail")
					times += 1
					print(times)
					counter = 0
	
	if counter < 50: 
		counter += 1
