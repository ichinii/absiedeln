extends Node2D

var center_length = 5
var tiles = []
var type_pool = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
var dicenumber_pool = [2,3,3,4,4,5,5,5,6,6,8,8,9,9,9,10,10,11,12]

	
	
	# create tiles
var nodes = {}

func generate_tiles():
	var Tile = preload("res://tile.tscn")
	
	# check whether parameters for map initialization are legit
	assert(center_length >= 4, "The minimum center length is 4!")
	var number_of_tiles = center_length + 2*3
	for i in range(4,center_length, -1):
		number_of_tiles + i*2
	assert(len(type_pool) == number_of_tiles, "Size of type_pool not matching number of tiles!")
	assert(len(dicenumber_pool) == number_of_tiles,"Size of number_pool not matching number of tiles!")
	
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
	
	center_length += 6
	for y in range(-center_length/2, center_length/2+1):
		var row_length = center_length - abs(y)
		
		for x in range(row_length):
			var tile = Tile.instantiate()
			
			var pos_x = 64 * abs(y) + (x - center_length/2) * 128
			var pos_y = y * 128 * sin(1/6.0 * 2*PI)
			
			tile.position = Vector2(pos_x, pos_y)
			tile.scale = Vector2(0.1, 0.1)
			tile.set_color(Color.GREEN)
			$Streets.add_child(tile)
			$Streets.scale = Vector2(0.5, 0.5)

func _ready() -> void:
	generate_tiles()

func _process(delta: float) -> void:
	pass
