extends Node2D
var obscats = load("res://Scene/Inside/indoorcats.tscn")
onready var file = 'res://sprite/catchedcats.txt'
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	load_file(file)

func load_file(file):

	var f = File.new()
	f.open(file, File.READ)
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		print(line)
		var cat = obscats.instance()
		add_child(cat)
	f.close()
	return
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
