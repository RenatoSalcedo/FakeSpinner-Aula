extends Node2D

onready var body = get_node("Body")

var speed = 0
var reduce = -2

func _ready():
	set_process(true)

func _process(delta):
	if speed > 1:
		speed += reduce * delta
	else:
		speed = 0
	
	body.rotation += delta * speed

func _on_Contato_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.is_pressed():
		speed += 6
		if speed < 100:
			speed = 100
