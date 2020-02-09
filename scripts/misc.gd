# Miscellaneous gdscript example functions

extends Node

class_name Misc

export (bool) var exported_bool = false

# Can't export a Node type
# export (Node) var exported_node

# Can export a NodePath with onready to get node
#export(NodePath) onready var node = get_node(node)

# Maybe better to do it this way though. Not sure
export var node_path: = NodePath()
onready var node: Node = get_node(node_path)

var _sprite : Sprite

func _init():
	# TODO: Move to groups script
	add_to_group("my_group")

func _ready():
	# Reverse call order of _ready()
	yield(owner, "ready")
	
	print("node is ", node.name)
	call_deferred("_deferred_function", "foo")

func _physics_process(delta):
	pass

func _change_scene():
	get_tree().change_scene("res://scenes/scene.tscn")

func _type_hint(param : bool) -> bool:
	return param

func _deferred_function(param):
	print("Deferred function: ", param)

static func static_function():
	print("Hello from static function")
