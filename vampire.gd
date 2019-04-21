extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
signal vampire_died

func _input(event):
	var cur = global_position
	var target = get_parent().get_node("dwarf").global_position
	print("~~~", cur)
	var delta = target - cur
	delta.x = speed * delta.x / abs(delta.x)
	delta.y = speed * delta.y / abs(delta.y)
	
	var collide = move_and_collide(delta)
	if collide and collide.collider.name == "dwarf":
		emit_signal ("vampire_died")
		get_parent().remove_child(self)
