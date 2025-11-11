extends CanvasLayer

func _ready() -> void:
	$Transition.transition(1)

func _on_l_1_pressed() -> void:
	$Music/button_press_sfx.play()
	$Transition.transition(0)
	await get_tree().create_timer(2.5).timeout
	get_tree().change_scene_to_file("res://levels/levels/level_1a.tscn")

func _on_l_2a_pressed() -> void:
	$Music/button_press_sfx.play()
	$Transition.transition(0)
	await get_tree().create_timer(2.5).timeout
	get_tree().change_scene_to_file("res://levels/levels/level_2a.tscn")

func _on_l_3a_pressed() -> void:
	$Music/button_press_sfx.play()
	$Transition.transition(0)
	await get_tree().create_timer(2.5).timeout
	get_tree().change_scene_to_file("res://levels/levels/level_3a.tscn")

func _on_l_4a_pressed() -> void:
	$Music/button_press_sfx.play()
	$Transition.transition(0)
	await get_tree().create_timer(2.5).timeout
	get_tree().change_scene_to_file("res://levels/levels/level_4.tscn")

func _on_l_1b_pressed() -> void:
	$Music/button_press_sfx.play()
	$Transition.transition(0)
	await get_tree().create_timer(2.5).timeout
	get_tree().change_scene_to_file("res://levels/levels/level_1b.tscn")

func _on_l_2b_pressed() -> void:
	$Music/button_press_sfx.play()
	$Transition.transition(0)
	await get_tree().create_timer(2.5).timeout
	get_tree().change_scene_to_file("res://levels/levels/level_2b.tscn")

func _on_l_3b_pressed() -> void:
	$Music/button_press_sfx.play()
	$Transition.transition(0)
	await get_tree().create_timer(2.5).timeout
	get_tree().change_scene_to_file("res://levels/levels/level_3b.tscn")
