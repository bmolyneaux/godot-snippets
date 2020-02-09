extends Spatial

var queue
var resource = "res://async_loading/scene_to_load.tscn"

func _ready():
	queue = preload("res://async_loading/resource_queue.gd").new()
	queue.start()
	queue.queue_resource(resource)
	queue.connect(resource, self, "_on_resource_loaded", [resource])

func _on_resource_loaded(path):
	print("Resource loaded ", path)
