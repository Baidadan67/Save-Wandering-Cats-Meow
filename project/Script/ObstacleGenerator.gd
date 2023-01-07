extends Node2D

var maxObstacle = 10
var obstacleScene = load("res://Scene/Outside/Obstacle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(maxObstacle): 
		randomize() 
		var obstacle = obstacleScene.instance()
		add_child(obstacle)
