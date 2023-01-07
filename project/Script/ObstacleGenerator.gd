extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var maxObstacle = 5
var obstacleScene = load("res://Scene/Outside/Obstacle.tscn")
var vSize = 64 
var hSize = 64 

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(maxObstacle): 
		randomize() 
		var obstacle = obstacleScene.instance()
		obstacle.global_position.x = 212 + hSize * (randi() % (600 / hSize))
		obstacle.global_position.y = vSize * (randi() % (600 / vSize))
		print(obstacle.global_position.x, ' ', obstacle.global_position.y)
		add_child(obstacle)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
