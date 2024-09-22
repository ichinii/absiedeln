extends StaticBody2D

var center_length = 5
var tiles = []
var type_pool = []
var dicenumber_pool = []

func _ready() -> void:
	
	# check whether parameters for map initialization are legit
	assert(center_length >= 4, "The minimum center length is 4!")
	var number_of_tiles = center_length + 2*3
	for i in range(center_length-3):
		number_of_tiles += 2
	assert(len(type_pool) == number_of_tiles, "Size of type_pool not matching number of tiles!")
	assert(len(dicenumber_pool) == number_of_tiles,"Size of number_pool not matching number of tiles!")
	
	# create tiles
	var Tile = preload("res://tile.tscn")
	
	for y in range(-center_length/2, center_length/2+1):
		var row_length = center_length - abs(y)
		
		for x in range(row_length):
			var tile = Tile.instantiate()
			
			var pos_x = 64 * abs(y) + (x - center_length/2) * 128
			var pos_y = y * 128 * sin(1/6.0 * 2*PI)
			
			tile.position = Vector2(pos_x, pos_y)
			tile.dicenumber = dicenumber_pool.pick_random()
			dicenumber_pool.erase(tile.dicenumber)
			tile.Tiletype = type_pool.pick_random()
			type_pool.erase(tile.dicenumber)
			$Tiles.add_child(tile)

func _process(delta: float) -> void:
	pass
