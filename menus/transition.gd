extends CanvasLayer

func transition(placement: int):
	if placement == 0:
		$TextureRect.set_position(Vector2(1920, 0))
		for i in range(40):
			$TextureRect.position = $TextureRect.position.move_toward(Vector2(-350, 0), 60)
			await get_tree().create_timer(0.015).timeout
	elif placement == 1:
		$TextureRect.set_position(Vector2(-350, 0))
		for i in range(40):
			$TextureRect.position = $TextureRect.position.move_toward(Vector2(-2620, 0), 60)
			await get_tree().create_timer(0.015).timeout


func _on_main_menu_transition() -> void:
	transition(0)
