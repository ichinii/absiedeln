extends Node2D

var center_length = 5
var tiles = []

var nodes = []

var Tile = preload("res://tile.tscn")

var spacing = 1

func having_node(pos: Vector2):
	for node in nodes:
		if (node.position - pos).abs().dot(Vector2(1, 1)) < spacing:
			return true
	return false

func generate_nodes_for_tile(tile: Node2D):
	var pos = tile.position
	var right = Vector2(64, 0)
	var diagX = Vector2(cos(1/12.0 * PI*2), 0) * 64
	var diagY = Vector2(0, sin(1/12.0 * PI*2)) * 64
	
	var pos_nodes = []
	for i in range(6):
		pos_nodes.append(pos + 64 * Vector2(cos((1/12.0 + i/6.0) * PI*2), sin((1/12.0 + i/6.0) * PI*2)))
	
	for p in pos_nodes:
		if not having_node(p):
			var node = Tile.instantiate()
			node.position = p
			node.scale = Vector2(0.1, 0.1)
			node.set_color(Color.MEDIUM_VIOLET_RED)
			$Buildings.add_child(node)
			nodes.append(node)

func generate_tiles():
	for y in range(-center_length/2, center_length/2+1):
		var row_length = center_length - abs(y)
		
		for x in range(row_length):
			var tile = Tile.instantiate()
			
			var pos_x = (64 * abs(y) + (x - center_length/2) * 128) * cos(1/12.0 * 2*PI) * spacing
			var pos_y = (y * 128 * sin(1/6.0 * 2*PI)) * cos(1/12.0 * 2*PI) * spacing
			
			tile.position = Vector2(pos_x, pos_y)
			$Tiles.add_child(tile)
			
			generate_nodes_for_tile(tile)
	
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
