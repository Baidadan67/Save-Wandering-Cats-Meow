extends Node2D

var maxObstacle = 10
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
		
		while obstacle.global_position.x <= 360 and obstacle.global_position.y >= 460: 
			obstacle.global_position.x = 212 + hSize * (randi() % (600 / hSize))
			obstacle.global_position.y = vSize * (randi() % (600 / vSize))
		
		print(obstacle.global_position.x, ' ', obstacle.global_position.y)
		add_child(obstacle)
