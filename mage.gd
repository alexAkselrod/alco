extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dwarf
var nav2d
var new_path
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	dwarf = get_parent().get_node("dwarf")
	nav2d = get_parent().get_node("nav")


func _on_dwarf_next_move():
	new_path = nav2d.get_simple_path(position, dwarf.position)
	print(new_path)
	var distance = speed
	var start_point = position
	for path in new_path:
		var new_distance = start_point.distance_to(path)
		if distance <= new_distance and distance >= 0.0:
			position = start_point.linear_interpolate(new_path[0], distance / new_distance)
			break
		elif distance <= 0.0:
			position = new_path[0]	
			break
		distance -= new_distance
		start_point = new_path[0]
		new_path.remove(0)
