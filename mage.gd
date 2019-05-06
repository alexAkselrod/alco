extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dwarf
var nav2d
var tilemap
var new_path
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	dwarf = get_parent().get_node("dwarf")
	nav2d = get_parent().get_node("nav")
	tilemap = nav2d.get_node("tilemap")


func _on_dwarf_next_move():
	new_path = nav2d.get_simple_path(global_position, dwarf.position)
	print(new_path)
	var distance = speed
	var start_point = global_position
	var end_point = global_position
	for path in new_path:
		var new_distance = start_point.distance_to(path)
		if distance <= new_distance and distance >= 0.0:
			end_point = start_point.linear_interpolate(new_path[0], distance / new_distance)
			break
		elif distance <= 0.0:
			end_point = new_path[0]
			break
		distance -= new_distance
		start_point = new_path[0]
		new_path.remove(0)
	position = (end_point - Vector2(50,50)).snapped(Vector2(100,100)) + Vector2(50,50)
