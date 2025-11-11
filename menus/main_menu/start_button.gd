extends TextureButton
var original_position = Vector2(84, 589)
#start button

func _process(delta: float) -> void:
	if  original_position == position:
		original_position = Vector2(84, 589)
		original_position += Vector2(randi_range(-25, 25), randi_range(-25, 25))
	position = position.move_toward(original_position, delta * 5)

func _on_pressed() -> void:
	get_parent().pack_up.emit()
	await get_tree().create_timer(2.0).timeout
	get_parent().transition.emit()
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://menus/level_select/level_select.tscn")
	
func _on_main_menu_pack_up() -> void:
	disabled = true
	for i in range(20):
		position = position.move_toward(Vector2(84, 489), 10 - float(i))
		await get_tree().create_timer(0.02).timeout
	for i in range(40):
		position = position.move_toward(Vector2(84, 1200), 10 + float(i))
		await get_tree().create_timer(0.02).timeout
		
