extends CanvasLayer
signal level_one_complete(score: int)

func _on_level_1_level_complete(total_score: int, _completed_all_stacks: bool) -> void:
	level_one_complete.emit(total_score)
