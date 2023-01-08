extends KinematicBody2D


var velocity = Vector2.ZERO
var speed = 500
const ACCELERATION = 500
const MAX_SPEED = 300
const FRICTION = 500
const BOARDER = [212, 812, 0, 600]
const SIZE = [64, 64]
var directionList = ["up","down","right","left"]
enum {HIDDING, WANDER}
var state = WANDER
var player_position

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = rand_range( BOARDER[0] + SIZE[0] / 2, BOARDER[1] - SIZE[0] / 2)
	position.y = rand_range( BOARDER[2] + SIZE[0] / 2, BOARDER[3] - SIZE[0] / 2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var direction
	match state:
		HIDDING:
			direction = position.direction_to(player_position)
			direction = leave_wall(position, direction)
			direction = - direction
			velocity = velocity.move_toward(direction * 500, ACCELERATION * delta)
			velocity = move_and_slide(velocity)
			print(direction)
			$AnimatedSprite.animation =  "walk"
		
		WANDER:
			direction = Vector2(rand_range(-1,1),rand_range(-1,1))
			#direction = leave_wall(position,direction)
			velocity = velocity.move_toward(direction * 200, ACCELERATION * delta)
			velocity = move_and_slide(velocity)
			$AnimatedSprite.animation =  "walk"
			
		_: 
			$AnimatedSprite.animation =  "sit"

	if velocity.x > 0: 
		get_node("AnimatedSprite").set_flip_h(false)
	else: 
		get_node("AnimatedSprite").set_flip_h(true)

	position.x = clamp(position.x, BOARDER[0] + SIZE[0] / 2, BOARDER[1] - SIZE[0] / 2)
	position.y = clamp(position.y, BOARDER[2] + SIZE[0] / 2, BOARDER[3] - SIZE[0] / 2)
	

func _on_CatchArea_body_entered(body):
	if body.name == "Player":
		state = HIDDING
		player_position = body.position

func _on_CatchArea_body_exited(body):
	state = WANDER

func leave_wall(position, direction):
	if position.x <  BOARDER[0] + SIZE[0] * 2:
		direction.x = -1
	elif position.x >  BOARDER[1] - SIZE[0] * 2:
		direction.x = 1
	if position.y < BOARDER[2] + SIZE[0] * 2:
		direction.y = -1
	elif position.y > BOARDER[3] - SIZE[0] * 2:
		direction.y = 1
	return direction
