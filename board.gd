extends Node2D

var center_length = 5
var tiles = []
var type_pool = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
var dicenumber_pool = [2,3,3,4,4,5,5,5,6,6,8,8,9,9,9,10,10,11,12]

var nodes = []

var Tile = preload("res://tile.tscn")
var Street = preload("res://street.tscn")
var Building = preload("res://bulding.tscn")

var spacing = 1.05
var spacing_diag = spacing * cos(1/12.0 * 2*PI)

func having_node(pos: Vector2):
	for node in nodes:
		if (node.position - pos).abs().dot(Vector2(1, 1)) < spacing:
			return node
	return null

func generate_buildings_for_tile(tile: Node2D):
	var pos = tile.position
	var right = Vector2(64, 0)
	var diagX = Vector2(cos(1/12.0 * PI*2), 0) * 64
	var diagY = Vector2(0, sin(1/12.0 * PI*2)) * 64
	
	var pos_nodes = []
	for i in range(6):
		var p = 64 * Vector2(cos((1/12.0 + i/6.0) * PI*2), sin((1/12.0 + i/6.0) * PI*2))
		p *= spacing
		p += pos
		pos_nodes.append(p)
	
	for i in len(pos_nodes):
		var p = pos_nodes[i]
		if not having_node(p):
			var node = Building.instantiate()
			node.position = p
			node.scale = Vector2(0.1, 0.1) * 0.6
			$Buildings.add_child(node)
			nodes.append(node)
			
			tile.buildings.append(node)
			node.tiles.append(tile)

func generate_streets_for_tile(tile: Node2D):
	var pos = tile.position
	var right = Vector2(64, 0)
	var diagX = Vector2(cos(1/12.0 * PI*2), 0) * 64
	var diagY = Vector2(0, sin(1/12.0 * PI*2)) * 64
	
	var pos_nodes = []
	for i in range(6):
		var p = 64 * Vector2(cos((i/6.0) * PI*2), sin((i/6.0) * PI*2))
		p *= spacing_diag
		p += pos
		pos_nodes.append(p)
	
	for p in pos_nodes:
		if not having_node(p):
			var node = Street.instantiate()
			node.position = p
			node.scale = Vector2(0.1, 0.1) * 0.4
			$Buildings.add_child(node)
			nodes.append(node)

# create tiles
func generate_tiles():
	# check whether parameters for map initialization are legit
	assert(center_length >= 4, "The minimum center length is 4!")
	var number_of_tiles = center_length + 2*3
	for i in range(4, center_length):
		number_of_tiles += i*2
	print(number_of_tiles)
	assert(len(type_pool) == number_of_tiles, "Size of type_pool not matching number of tiles!")
	assert(len(dicenumber_pool) == number_of_tiles,"Size of number_pool not matching number of tiles!")
	
	for y in range(-center_length/2, center_length/2+1):
		var row_length = center_length - abs(y)
		
		for x in range(row_length):
			var tile = Tile.instantiate()
			
			var pos_x = (64 * abs(y) + (x - center_length/2) * 128) * spacing_diag
			var pos_y = (y * 128 * sin(1/6.0 * 2*PI)) * spacing_diag
			
			tile.position = Vector2(pos_x, pos_y)
			tile.dicenumber = dicenumber_pool.pick_random()
			dicenumber_pool.erase(tile.dicenumber)
			tile.tile_type = type_pool.pick_random()
			type_pool.erase(tile.dicenumber)
			$Tiles.add_child(tile)
			
			generate_buildings_for_tile(tile)
			generate_streets_for_tile(tile)
	
	return
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
