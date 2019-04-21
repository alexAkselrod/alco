extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var cnt = 0
var max_count = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_vampire_died ():
	cnt -= 1

func add_vampire ():
	if cnt >= max_count:
		return
		
	cnt += 1
	
	var scene = load("res://vampire.tscn")
	var new_vamp = scene.instance()
	new_vamp.set_name("vampire" + str(cnt))
	
	print ("@@@", global_position)	
	get_parent().add_child(new_vamp)
	new_vamp.connect("vampire_died", self, "on_vampire_died")
	new_vamp.global_position = global_position	

func _on_Timer_timeout():	
	add_vampire()
	print ("new timer invoked!", get_parent().name)
