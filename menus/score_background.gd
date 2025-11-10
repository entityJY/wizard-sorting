extends TextureRect

func _on_level_finish_ui_level_one_complete(score: int) -> void:
	var i = 0
	while position.y > 225:
		position.y -= 10 + i
		await get_tree().create_timer(0.02).timeout
		i = i + 1
	for j in range(18):
		position.y -= 10 + i
		await get_tree().create_timer(0.02).timeout
		i = i - 1
