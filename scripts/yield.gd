extends Node

# More examples here:
# https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/gdscript_basics.html#coroutines-with-yield


func print_world_after_yielding():
	yield()
	print("world")


func print_hello_world_using_yield_resume():
	var function_state = print_world_after_yielding()
	print("Hello")
	function_state.resume()


func wait_one_frame():
	yield(get_tree(), "idle_frame")


func _ready():
	# Silly example of yield() and resume()
	print_hello_world_using_yield_resume()
	
	# The completed signal is automatically emitted after the function completes
	yield(wait_one_frame(), "completed")
	
	print("Hello from the next frame")
	
	# Can also get a signal's argument(s) - a single value or an array of values
	var node = yield(get_tree(), "node_added")
