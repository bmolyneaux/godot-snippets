extends Node

var misc_script = preload("res://scripts/misc.gd")

func _instance_node():
	add_child(Node.new())

func _instance_scene():
	var scene = load("res://scenes/scene.tscn").instance() as Node2D
	# Can initialize before adding to scene
	scene.position = Vector2(0, 0)
	add_child(scene)
	
func _instance_script():
	var node = Node.new()
	node.script = misc_script
	# Sometimes need to use call_deferred with add_child
	get_parent().call_deferred("add_child", node)
