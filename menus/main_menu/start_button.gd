extends TextureButton
#start button

func _on_pressed() -> void:
	get_parent().pack_up.emit()
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://levels/level_1/level_1.tscn")
	
func _on_main_menu_pack_up() -> void:
	for i in range(20):
		position.y -= i/2
		await get_tree().create_timer(0.015).timeout
	for i in range(40):
		position.y += i*3
		await get_tree().create_timer(0.015).timeout
