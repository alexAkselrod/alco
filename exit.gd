extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal game_over_win

var dwarf
# Called when the node enters the scene tree for the first time.
func _ready():
	dwarf = get_parent().get_node("dwarf")
	pass # Replace with function body.

func _on_dwarf_next_move():
	var dist = global_position.distance_to(dwarf.global_position)

	if global_position.distance_to(dwarf.global_position) <= 100:
		emit_signal("game_over_win")
		get_tree().change_scene("res://finish.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
