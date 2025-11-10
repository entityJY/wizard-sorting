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
	get_tree().change_scene_to_file("res://levels/basic_level.tscn")
	
func _on_main_menu_pack_up() -> void:
	for i in range(20):
		position.y -= i/2
		await get_tree().create_timer(0.015).timeout
	for i in range(40):
		position.y += i*3
		await get_tree().create_timer(0.015).timeout
		
