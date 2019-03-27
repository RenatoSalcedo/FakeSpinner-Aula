extends Node

onready var lblScoreP1 = get_node("Control/P1/Score")
onready var lblScoreP2 = get_node("Control/P2/Score")

onready var msgScoreP1 = get_node("Control/P1/Msg")
onready var msgScoreP2 = get_node("Control/P2/Msg")

onready var timer = get_node("CountDown")

var unlockSpinnerP1 = false
var unlockSpinnerP2 = false

var score_p1 = 0
var score_p2 = 0
signal block
signal unlock

var reseting = false
var time

func _ready():
	pass 

func attScore():
	lblScoreP1.text = str(score_p1)
	lblScoreP2.text = str(score_p2)
	
	emit_signal("block")
	unlockSpinnerP1 = false
	unlockSpinnerP2 = false

func _on_SpinnerP1_limit():
	score_p1 += 1
	msgScoreP1.text = "Você ganhou!!"
	msgScoreP2.text = "Você perdeu!!"
	attScore()


func _on_SpinnerP2_limit():
	score_p2 += 1
	msgScoreP2.text = "Você ganhou!!"
	msgScoreP1.text = "Você perdeu!!"
	attScore()

func _on_SpinnerP1_inStart():
	unlockSpinnerP1 = true
	if unlockSpinnerP2:
		reset()


func _on_SpinnerP2_inStart():
	unlockSpinnerP2 = true
	if unlockSpinnerP1:
		reset()

func reset():
	if reseting: return
	
	reseting = true
	
	msgScoreP1.text = ""
	msgScoreP2.text = ""
	time = 5
	timer.start()
	

func _on_CountDown_timeout():
	time -= 1
	
	if time > 1:
		lblScoreP1.text = str(time-1)
		lblScoreP2.text = str(time-1)
		
	if time == 1:
		lblScoreP1.text = "GO!!"
		lblScoreP2.text = "GO!!"
		reseting = false
		emit_signal("unlock")
	
	if time == 0:
		lblScoreP1.text = ""
		lblScoreP2.text = ""
	
	lblScoreP1.text = str(score_p1)
	lblScoreP2.text = str(score_p2)