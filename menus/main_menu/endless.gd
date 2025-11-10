extends TextureButton
var original_position = Vector2(300, 775)
#level select

func _process(delta: float) -> void:
	if  original_position == position:
		original_position = Vector2(300,775)
		original_position += Vector2(randi_range(-25, 25), randi_range(-25, 25))
	position = position.move_toward(original_position, delta * 5)


func _on_pressed() -> void:
	get_parent().pack_up.emit()
	

func _on_main_menu_pack_up() -> void:
	disabled = true
	await get_tree().create_timer(0.5).timeout
	for i in range(20):
		position = position.move_toward(Vector2(300, 675), 10 - float(i))
		await get_tree().create_timer(0.02).timeout
	for i in range(20):
		position = position.move_toward(Vector2(300, 1200), 10 + float(i))
		await get_tree().create_timer(0.02).timeout
	
