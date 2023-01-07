extends Node2D

var player_node

# Called when the node enters the scene tree for the first time.
func _ready():
	player_node = get_parent().get_node("Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match player_node.times: 
		1: 
			$Head1.visible = false
		2: 
			$Head2.visible = false
		3: 
			$Head3.visible = false
