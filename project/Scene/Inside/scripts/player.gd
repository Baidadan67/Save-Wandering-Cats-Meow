extends KinematicBody2D

# this is used for character's motion
#first setup the variable velocity
var velocity = Vector2.ZERO
const MAX_SPEED = 500
const ACCELERATION = 1000
const FRICTION = 600
var screen_size

func _physics_process(delta):
	player_move(delta)

func _ready():
	screen_size = get_viewport_rect().size
	
func player_move(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move_and_collide(velocity * delta)
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 2*(screen_size.y)/3, 3*(screen_size.y)/4)
	if velocity.x != 0:
		$indoorPlayerAni.animation = "walk"
	else:
		$indoorPlayerAni.animation = "still"
	if velocity.x > 0:
		$indoorPlayerAni.flip_h = true
	else:
		$indoorPlayerAni.flip_h = false
	# press space to select a cat...
	if Input.is_action_pressed("ui_select"):
		print("you select!")
		
func detect_collision():
	pass
	
