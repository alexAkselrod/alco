extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 5000

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
	if event.is_action_pressed("ui_up"):
		move(DIRECTION.N)
	elif event.is_action_pressed("ui_up_right"):
		move(DIRECTION.NE)
	elif event.is_action_pressed("ui_right"):
		move(DIRECTION.E)
	elif event.is_action_pressed("ui_down_right"):
		move(DIRECTION.SE)
	elif event.is_action_pressed("ui_down"):
		move(DIRECTION.S)
	elif event.is_action_pressed("ui_down_left"):
		move(DIRECTION.SW)
	elif event.is_action_pressed("ui_left"):
		move(DIRECTION.W)
	elif event.is_action_pressed("ui_up_left"):
		move(DIRECTION.E)
	

func move(direction):
	match(direction):
		DIRECTION.N:
			move_and_slide(Vector2(0, -speed))
		DIRECTION.NE:
			move_and_slide(Vector2(speed,-speed))
		DIRECTION.E:
			move_and_slide(Vector2(speed,0))
		DIRECTION.SE:
			move_and_slide(Vector2(speed,speed))
		DIRECTION.S:
			move_and_slide(Vector2(0,speed))
		DIRECTION.SW:
			move_and_slide(Vector2(-speed,speed))
		DIRECTION.W:
			move_and_slide(Vector2(-speed,0))
		DIRECTION.NW:
			move_and_slide(Vector2(-speed,-speed))