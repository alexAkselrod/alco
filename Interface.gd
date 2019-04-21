extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# health is measured in percents
func on_health_changed (health):
	var size = get_node("total_bar").get_size().x * health
	var cur = get_node("health_bar").get_size()
	cur.x = size
	get_node("health_bar").set_size(cur)
	
func _input(event):
	on_health_changed (0.9)