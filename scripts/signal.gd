extends Node

signal my_signal(bound_parameter, emitted_parameter)

func _ready():
	connect("my_signal", self, "_handle_signal", ["bound"])
	connect("my_signal", self, "_handle_signal_deferred", ["bound"], CONNECT_DEFERRED)
	connect("my_signal", self, "_handle_signal_oneshot", ["bound"], CONNECT_ONESHOT)
	emit_signal("my_signal", "emitted")
	emit_signal("my_signal", "emitted")

func _handle_signal(bound_parameter, emitted_parameter):
	print("Received signal")

func _handle_signal_deferred(bound_parameter, emitted_parameter):
	print("Received signal deferred")

func _handle_signal_oneshot(bound_parameter, emitted_parameter):
	print("Received signal oneshot")
