extends RichTextLabel


func _on_level_finish_ui_level_one_complete(score: int) -> void:
	text = "Score: " + str(score)
