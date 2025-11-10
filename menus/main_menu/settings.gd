extends TextureButton
#settings


func _on_pressed() -> void:
	get_parent().pack_up.emit()
	await get_tree().create_timer(2.5).timeout
	get_tree().change_scene_to_file("res://menus/settings/settings.tscn")
	
func _on_main_menu_pack_up() -> void:
	await get_tree().create_timer(1.0).timeout
	for i in range(20):
		position.y -= i/2
		await get_tree().create_timer(0.015).timeout
	for i in range(20):
		position.y += i*3
		await get_tree().create_timer(0.015).timeout
