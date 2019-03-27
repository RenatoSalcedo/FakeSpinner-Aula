extends Node2D

onready var body = get_node("Body")
onready var img = get_node("Body/Color")

var speed = 0
var reduce = -2

var block = false

signal speedCount(valor)
signal limit
signal inStart

func _ready():
	set_process(true)

func _process(delta):
	if speed > 1:
		speed += reduce * delta
	else:
		speed = 0
		reduce = -2
		if block:
			emit_signal("inStart")
	
	body.rotation += delta * speed
	emit_signal("speedCount", speed/100)

func _on_Contato_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.is_pressed() and not block:
		speed += 6
		if speed > 100:
			speed = 100
			emit_signal("limit")


func _on_btnRed_pressed():
	img.set_texture(load("res://assets/red_ready.png"))


func _on_btnYellow_pressed():
	img.set_texture(load("res://assets/yellow_ready.png"))


func _on_btnBlack_pressed():
	img.set_texture(load("res://assets/black_ready.png"))


func _on_Main_block():
	block = true
	reduce = -6


func _on_Main_unlock():
	block = false
