extends MeshInstance

func _ready():
	var spatial = get_surface_material(0) as SpatialMaterial
	
	# Change the shader used for this spatial material to demonstrate that
	# shader compilation occurs. Hitching is sometimes but not always evident.
	yield(get_tree().create_timer(1), "timeout")
	spatial.flags_transparent = true
	
	# Change the albedo to demonstrate that shader compilation does not occur.
	yield(get_tree().create_timer(1), "timeout")
	spatial.albedo_color = Color.cyan
