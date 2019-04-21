extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dwarf
var nav2d
var new_path
var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	dwarf = get_parent().get_node("dwarf")
	nav2d = get_parent().get_node("nav")
	new_path = nav2d.get_simple_path(position, dwarf.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	var new_position_x = (dwarf.position.x - position.x) / speed
#	var new_position_y = (dwarf.position.y - position.y) / speed
#	var new_position = Vector2(new_position_x, new_position_y)
#	var collision = move_and_collide(new_position)

	var distance = delta * speed
	var start_point = position
	for i in range(new_path.size()):
		var new_distance = start_point.distance_to(new_path[i])
		if distance <= new_distance and distance >= 0.0:
			position = start_point.linear_interpolate(new_path[0], distance / new_distance)
			break
		elif distance <= 0.0:
			position = new_path[0]	
			break
		distance -= new_distance
		start_point = new_path[0]
		new_path.remove(0)	
	
