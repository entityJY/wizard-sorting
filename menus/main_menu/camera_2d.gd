extends Camera2D


func _process(delta: float) -> void:
	while zoom != Vector2(0.85, 0.85):
		zoom = zoom.move_toward(Vector2(0.85, 0.85), delta * 0.0001)
		await get_tree().create_timer(0.375).timeout
	await get_tree().create_timer(5.0).timeout
	while zoom != Vector2(1, 1):
		zoom = zoom.move_toward(Vector2(1, 1), delta * 0.0001)
		await get_tree().create_timer(0.375).timeout
