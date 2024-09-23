extends Node

var players = []
var active_player
var game_ended = false


	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func roll_dice() -> int:
	var roll1 = randi_range(1,6)
	var roll2 = randi_range(1,6)
	return(roll1+roll2)
