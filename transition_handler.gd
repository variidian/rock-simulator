extends Node 
func change_scene(target: String, from: String) -> void:
	ResourceLoader.load_threaded_request(target)
	while ResourceLoader.load_threaded_get_status(target) != ResourceLoader.THREAD_LOAD_LOADED:
		await get_tree().create_timer(0.1).timeout
	var target_scene := ResourceLoader.load_threaded_get(target) as PackedScene
	get_tree().root.add_child(target_scene.instantiate())
	get_tree().root.get_node(from).queue_free()
