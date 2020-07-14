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


func _delay():
	# One-liner for delaying 1 second
	yield(get_tree().create_timer(1), "timeout")
