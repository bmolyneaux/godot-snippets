extends Area2D

func _on_entered(area : Area2D):
	assert area.get_collision_layer_bit(0)
	print("Entered by ", area.name)
