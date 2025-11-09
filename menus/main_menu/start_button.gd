extends TextureButton
signal start_game

func _on_pressed() -> void:
	start_game.emit()
