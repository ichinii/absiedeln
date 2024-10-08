extends StaticBody2D

var Tiletype = preload("res://tiletype.gd")

var tile_type = null

var type: int
var dicenumber: int

var buildings = []
var streets = []
var sprite = null

func _ready() -> void:
	$Label.text = str(dicenumber)

func _process(delta: float) -> void:
	pass

func set_tile_type(type):
	tile_type = type
	var sprites = [$Sprites/Forest, $Sprites/Pasture, $Sprites/Hills, $Sprites/Mountains, $Sprites/Field, $Sprites/Desert, $Sprites/Water]
	for sprite in sprites:
		sprite.visible = false
	sprite = sprites[tile_type]
	sprite.visible = true

func set_color(color: Color):
	sprite.modulate = color

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	var is_click = event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT
	if is_click:
		print("is_click")


func _on_mouse_entered() -> void:
	set_color(Color(1., 1.2, 1.2))


func _on_mouse_exited() -> void:
	set_color(Color(1, 1, 1))
