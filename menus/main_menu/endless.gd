extends TextureButton
#level select


func _on_pressed() -> void:
	get_parent().pack_up.emit()
	

func _on_main_menu_pack_up() -> void:
	await get_tree().create_timer(0.5).timeout
	for i in range(20):
		position.y -= i/2
		await get_tree().create_timer(0.015).timeout
	for i in range(40):
		position.y += i*3
		await get_tree().create_timer(0.015).timeout
	
