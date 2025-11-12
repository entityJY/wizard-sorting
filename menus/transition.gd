extends CanvasLayer
class_name Transition

signal finish_transition(position: int)

func transition(placement: int):
	if placement == 0:
		$TextureRect.set_position(Vector2(1920, 0))
		for i in range(40):
			$TextureRect.position = $TextureRect.position.move_toward(Vector2(-350, 0), 60)
			await get_tree().create_timer(0.015).timeout
		finish_transition.emit(0)
	elif placement == 1:
		$TextureRect.set_position(Vector2(-350, 0))
		for i in range(40):
			$TextureRect.position = $TextureRect.position.move_toward(Vector2(-2620, 0), 60)
			await get_tree().create_timer(0.015).timeout
		finish_transition.emit(1)


func _on_main_menu_transition() -> void:
	transition(0)
