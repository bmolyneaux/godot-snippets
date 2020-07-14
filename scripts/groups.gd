extends Node

var my_property : int


func _ready():
	add_to_group("my_group")
	assert(get_tree().has_group("my_group"))
	assert(self in get_tree().get_nodes_in_group("my_group"))
	
	get_tree().call_group("my_group", "my_function")
	
	get_tree().notify_group("my_group", NOTIFICATION_CRASH)
	get_tree().notify_group_flags(SceneTree.GROUP_CALL_REVERSE, "my_group", NOTIFICATION_CRASH)
	
	# GROUP_CALL_REALTIME will cause the flag to be set immediately, whereas the
	# other set, call, and notify will be deferred.
	get_tree().set_group_flags(SceneTree.GROUP_CALL_REALTIME, "my_group", "my_property", 42)
	get_tree().set_group("my_group", "my_property", 0)
	
	assert(my_property == 42)
	yield(get_tree(), "idle_frame")
	assert(my_property == 0)


func my_function():
	print("My function called")


func _notification(what):
	match what:
		NOTIFICATION_CRASH:
			print("Kaboom!")
