extends TextureButton
signal level_select

func _on_pressed() -> void:
	level_select.emit()
