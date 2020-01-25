extends Node

var misc_script = preload("res://scripts/misc.gd")

func _instance_node():
	add_child(Node.new())
	
func _instance_script():
	var node = Node.new()
	node.script = misc_script
	get_parent().call_deferred("add_child", node)

func _instance_scene():
	add_child(load("res://scenes/scene.tscn").instance())
