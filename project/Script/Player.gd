extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 80
const FRICTION = 500
var velocity = Vector2.ZERO
var times = 0
var pro = [0.3, 0.5]
var capture = false

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
	
	# 碰撞不同物体同时计数不同
	if Input.get_action_strength("ui_accept"):
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision.collider.name == "tree":
				times += get_slide_count()
	
	for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision.collider.name == "tree":
				if Input.get_action_strength("ui_accept") and times==5 :
					print(times)
					if randf() <= pro[0]:
						print("caputure")
					else:
						print("fail")
				elif  Input.get_action_strength("ui_accept") and times ==12:
					if randf() <= pro[1]:
						print("caputure")
					else:
						print("fail")
				elif Input.get_action_strength("ui_accept") and times== 40:
						print("capture")
