extends Sprite

var is_material_instance = false

func _ready():
	material.set_shader_param("color", Color.blue)

func create_material_instance():
	# This was necessary to enable a dynamic material instance
	# in the ColorSprite tool class.
	if not is_material_instance:
		if material:
			material = material.duplicate()
		else:
			material = load("res://materials/color.tres")
		is_material_instance = true
