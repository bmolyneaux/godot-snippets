# Miscellaneous gdscript example functions

extends Node

class_name Misc

export (bool) var exported_bool = false

# Can't export a Node type
# export (Node) var exported_node

# Can export a NodePath with onready to get node
export(NodePath) onready var node = get_node(node)

var _sprite : Sprite

func _ready():
	print("node is ", node.name)

func _physics_process(delta):
	pass

func _change_scene():
	get_tree().change_scene("res://scenes/scene.tscn")

func _type_hint(param : bool) -> bool:
	return param

static func static_function():
	print("Hello from static function")
