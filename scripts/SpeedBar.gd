extends ProgressBar

func _ready():
	pass 

func _on_Spinner_speedCount(valor):
	value = valor * max_value
