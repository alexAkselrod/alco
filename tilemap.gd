extends TileMap

const floor_tiles_ids = [0,1,3,4,5]

func _ready():
	var max_x=0
	var max_y=0
	for cell in get_used_cells():
		max_x = max(max_x, cell.x)
		max_y = max(max_y, cell.y)
	for x in range(0, max_x):
		for y in range(0,max_y):
			var cell = get_cell(x,y)
			if cell == INVALID_CELL:
				set_cell(x,y, floor_tiles_ids[randi()%(len(floor_tiles_ids))])
