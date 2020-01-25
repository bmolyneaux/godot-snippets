extends Node

func _ready():
	_setup_timer()

# Create timer and connect signal
func _setup_timer():
	var timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "_on_timeout")
	timer.one_shot = true
	timer.start(1.0)

func _on_timeout():
	print("Timer finished")
