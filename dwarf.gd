extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var direction
var x_speed = 1000
# Called when the node enters the scene tree for the first time.

enum DIRECTION {
	N,NE,E,SE,S,SW,W,NW
}
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	print(get_parent().get_node("dwarf").position.x)
	if event.is_action_pressed("ui_right"):
		move_and_slide(Vector2(x_speed, 0))
		direction = DIRECTION.E
	

func _on_fat_area_entered(area):
	print(area)
	if direction == DIRECTION.E:
				move_and_slide(Vector2(-x_speed, 0))
