extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 300
const FRICTION = 500
const BOARDER = [212, 812, 0, 600]
const SIZE = [64, 64]
var velocity = Vector2.ZERO
var times = 0
var pro = [0.3, 0.5, 1]
var captured = false
var counter = 100 
var max_counter = 100 
var captures = load("res://Scene/Outside/capture.tscn")
var fails = load("res://Scene/Outside/Fail.tscn")

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") -  Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") -  Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	if input_vector.x > 0: 
		get_node("AnimatedSprite").set_flip_h(true)
	else: 
		get_node("AnimatedSprite").set_flip_h(false)
		
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
	else:
		$AnimatedSprite.animation = "still"
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity. move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)

	position.x = clamp(position.x, BOARDER[0] + SIZE[0] / 2, BOARDER[1] - SIZE[0] / 2)
	position.y = clamp(position.y, BOARDER[2] + SIZE[0] / 2, BOARDER[3] - SIZE[0] / 2)
	
	#file.open('res://sprite/catchedcats.json',File.WRITE)
	for i in get_slide_count():
			var collision = get_slide_collision(i)
			# print(collision.collider.name) 
			if collision.collider.name == "Cat" and counter == max_counter: 
				if Input.get_action_strength("ui_accept"): 
					if randf() <= pro[times]: 
						print("caputure")
						var data = collision.collider.get_node("AnimatedSprite").animation
						print(data[3])
						var json = to_json(data)
						print(json)
						save(data[3])
						#file.store_line(json)
						
						collision.collider.queue_free()
						captured = true
						var capture = captures.instance()
						capture.position.x = 850
						capture.position.y = 508
						get_parent().add_child(capture)
					else:
						print("fail")
						var fail = fails.instance()
						fail.position.x = 850
						fail.position.y = 508
						get_parent().add_child(fail)
					times += 1
					counter = 0
					#print(times)
	
	if counter < max_counter and captured == false: 
		counter += 1
		modulate.a = 0.5
	else: 
		modulate.a = 1

func save(color):
	Global.catList.append(color)
	return
