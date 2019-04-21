extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dwarf
# Called when the node enters the scene tree for the first time.
func _ready():
	dwarf = get_parent().get_parent().get_node("dwarf")
	pass # Replace with function body.

func _process(delta):
	var size = get_node("total_bar").get_size().x * (dwarf.health / 100.0)
	var cur = get_node("health_bar").get_size()
	cur.x = size
	get_node("health_bar").set_size(cur)
