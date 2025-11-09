extends TextureButton
signal settings

func _on_pressed() -> void:
	settings.emit()
