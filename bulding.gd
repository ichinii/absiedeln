extends StaticBody2D

var streets = []
var tiles = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_color(color: Color):
	$Polygon2D.modulate = color

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	var is_click = event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT
	if is_click:
		print("is_click")


func _on_mouse_entered() -> void:
	set_color(Color(2, 2, 2))


func _on_mouse_exited() -> void:
	set_color(Color(1, 1, 1))
