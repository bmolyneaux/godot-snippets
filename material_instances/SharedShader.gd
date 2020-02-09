extends MeshInstance

var colors = [
	Color.red,
	Color.blue,
	Color.yellow,
	Color.green,
	Color.orange,
	Color.purple,
]

var current_color = 0

func _ready():
	# Use a unique material instance for this mesh by duplicating the material
	set_surface_material(0, get_surface_material(0).duplicate())
	change_instance_every_second()
	
func change_instance_every_second():
	# Change a shader parameter every second to illustrate that no shader
	# compilation happens (no hitches).
	while true:
		get_surface_material(0).set_shader_param("albedo", colors[current_color])
		current_color = (current_color + 1) % len(colors)
		yield(get_tree().create_timer(1), "timeout")
