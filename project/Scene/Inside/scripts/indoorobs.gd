extends Node2D
var obscats = load("res://Scene/Inside/indoorcats.tscn")
var screen_size
var rng = RandomNumberGenerator.new()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	load_file(screen_size)
	randomize()

func load_file(screen_size):

	for c in Global.catList: 
		var cat = obscats.instance()
		cat.position.x = rng.randi_range(0,screen_size.x) 
		cat.position.y = rng.randi_range(2*(screen_size.y)/3,screen_size.y)
		cat.color = c
		#print(rng.randi_range(0,screen_size.x))
		add_child(cat)
	return
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
