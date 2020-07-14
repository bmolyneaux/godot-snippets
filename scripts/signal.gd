extends Node

signal my_signal

# The arguments can optionally be declared as in
#   signal my_signal(param1, param2)
# but these are just used by the editor to generate function signatures.


func _ready():
	# Simple signal connection
	connect("my_signal", self, "_handle_signal")
	# Connect a signal with a bound parameter (like partial application)
	connect("my_signal", self, "_handle_signal_with_bound_parameter", ["bound"])
	# This connection will be removed after the first time it is fired
	connect("my_signal", self, "_handle_signal_oneshot", [], CONNECT_ONESHOT)
	# Calling the handler function is deferred until idle
	connect("my_signal", self, "_handle_signal_deferred", [], CONNECT_DEFERRED)
	
	# Although we emit twice, the oneshot will only be fired once
	emit_signal("my_signal", "param")
	emit_signal("my_signal", "param")
	
	# Signals can also be created dynamically
	add_user_signal("dynamic_signal")
	connect("dynamic_signal", self, "_handle_dynamic_signal")
	emit_signal("dynamic_signal")


func _handle_signal(param):
	print("Received signal")


func _handle_signal_with_bound_parameter(bound, emitted):
	print("Received signal with bound parameter")


func _handle_signal_oneshot(param):
	print("Received signal oneshot")


func _handle_signal_deferred(param):
	print("Received signal deferred")


func _handle_dynamic_signal():
	print("Received dynamic signal")
