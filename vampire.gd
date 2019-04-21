extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 100
var dwarf
# Called when the node enters the scene tree for the first time.
func _ready():
	dwarf = get_parent().get_node("dwarf")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
signal vampire_died

func on_next_move():
	var cur = position
	var target = dwarf.position
	var delta = (target - cur).normalized() * speed
	
#	delta.x = speed * delta.x / abs(delta.x)
#	delta.y = speed * delta.y / abs(delta.y)
	
	var collide = move_and_collide(delta)
	if collide and collide.collider.name == "dwarf":
		
		dwarf.disconnect("next_move", self, "on_next_move")
		emit_signal ("vampire_died")
		get_parent().remove_child(self)