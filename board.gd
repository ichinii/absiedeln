extends StaticBody2D

var center_length = 5
var tiles = []

func _ready() -> void:
	var Tile = preload("res://tile.tscn")
	
	for y in range(-center_length/2, center_length/2+1):
		var row_length = center_length - abs(y)
		
		for x in range(row_length):
			var tile = Tile.instantiate()
			
			var pos_x = 64 * abs(y) + (x - center_length/2) * 128
			var pos_y = y * 128 * sin(1/6.0 * 2*PI)
			
			tile.position = Vector2(pos_x, pos_y)
			$Tiles.add_child(tile)

func _process(delta: float) -> void:
	pass
