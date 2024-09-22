extends StaticBody2D

var Tiletype = preload("res://tiletype.gd")

var tile_type = null

var type: int
var dicenumber: int

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func set_color(color: Color):
	$Polygon2D.color = color

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	var is_click = event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT
	if is_click:
		print("is_click")


func _on_mouse_entered() -> void:
	set_color(Color(1, 0, 0))


func _on_mouse_exited() -> void:
	set_color(Color(1, 1, 1))
