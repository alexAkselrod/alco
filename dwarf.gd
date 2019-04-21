extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 1000

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
	print(position.x)
	if event.is_action_pressed("ui_up"):
		move(Vector2(0, -speed))
	elif event.is_action_pressed("ui_up_right"):
		move(Vector2(speed,-speed))
	elif event.is_action_pressed("ui_right"):
		move(Vector2(speed,0))
	elif event.is_action_pressed("ui_down_right"):
		move(Vector2(speed,speed))
	elif event.is_action_pressed("ui_down"):
		move(Vector2(0,speed))
	elif event.is_action_pressed("ui_down_left"):
		move(Vector2(-speed,speed))
	elif event.is_action_pressed("ui_left"):
		move(Vector2(-speed,0))
	elif event.is_action_pressed("ui_up_left"):
		move(Vector2(-speed,-speed))
	

func move(vector):
	if (test_move(transform, vector)):
		position = position + vector