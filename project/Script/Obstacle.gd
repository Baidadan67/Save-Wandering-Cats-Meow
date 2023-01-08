extends Node2D

var vSize = 64 
var hSize = 64 
var sprite = ["bucket", "bush"]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize() 
	
	position.x = 212 + hSize * (randi() % (600 / hSize))
	position.y = vSize * (randi() % (600 / vSize))
		
	while $Area2D.get_overlapping_areas() or (position.x <= 360 and position.y >= 460): 
		position.x = 212 + hSize * (randi() % (600 / hSize))
		position.y = vSize * (randi() % (600 / vSize))

	var choice = randi() % (len(sprite))
	$AnimatedSprite.animation = sprite[choice]
