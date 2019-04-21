extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dwarf
var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	dwarf = get_parent().get_node("dwarf")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var new_position_x = (dwarf.position.x - position.x) / speed
	var new_position_y = (dwarf.position.y - position.y) / speed
	var new_position = Vector2(new_position_x, new_position_y)
	var collision = move_and_collide(new_position)
	print("collision: ", collision)
	
