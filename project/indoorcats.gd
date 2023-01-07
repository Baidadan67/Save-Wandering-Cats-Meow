extends KinematicBody2D

export var speed = 200 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
export var velocity = Vector2.ZERO
var rng = RandomNumberGenerator.new()
var frame_count #used to count how many frames we need for cats change their velocity
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	rng.randomize()
	frame_count = 0
	randomize()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	 # The player's movement vector.
	if frame_count <= 0:
		velocity.x = rng.randf_range(-1.0,1.0)
		velocity.y = rng.randf_range(-1.0,1.0)
		frame_count = 200 
	else:
		frame_count -= 1
	#print(velocity)
	
	if velocity.length()>0:
		velocity = velocity.normalized() * speed
	#velocity = move_and_slide(velocity)
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stopp()
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	if velocity.x < 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
		
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()