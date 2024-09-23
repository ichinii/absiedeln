extends StaticBody2D

var Tiletype = preload("res://tiletype.gd")

var tile_type = null

var type: int
var dicenumber: int

var buildings = []
var streets = []

func _ready() -> void:
	$Label.text = str(dicenumber)

func _process(delta: float) -> void:
	pass

func set_color(color: Color):
	$Sprite2D.modulate = color
	print("x")

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	var is_click = event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT
	if is_click:
		print("is_click")


func _on_mouse_entered() -> void:
	set_color(Color(1, 0, 0))


func _on_mouse_exited() -> void:
	set_color(Color(1, 1, 1))
