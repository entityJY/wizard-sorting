extends CanvasLayer

func _ready() -> void:
	$Transition.transition(1)

func _on_l_1_pressed() -> void:
	$Transition.transition(0)
	await get_tree().create_timer(2.5).timeout
	get_tree().change_scene_to_file("res://levels/levels/level_1.tscn")
