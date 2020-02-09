extends Sprite

var is_material_instance = false

func _ready():
	material.set_shader_param("color", Color.blue)

func create_material_instance():
	# Sharing a material also means sharing the instance.
	# You either need to mark the material resource as unique or duplicate the
	# material as we do here.
	# https://godotengine.org/qa/2866/how-do-i-make-material-shader-instances-2d
	if not is_material_instance:
		if material:
			material = material.duplicate()
		else:
			material = load("res://materials/color.tres")
		is_material_instance = true
