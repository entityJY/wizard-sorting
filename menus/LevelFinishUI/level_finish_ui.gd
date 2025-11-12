extends CanvasLayer

@export var next_level: PackedScene
signal level_one_complete(score: int)

@export var transition: Transition

func _ready():
	if !next_level:
		$ScoreBackground/Continue.visible = false

func _on_level_1_level_complete(total_score: int, _completed_all_stacks: bool) -> void:
	level_one_complete.emit(total_score)

func _on_continue_button_down() -> void:
	if transition:
		transition.transition(0)
		await transition.finish_transition
	get_tree().change_scene_to_packed(next_level)

func _on_return_to_menu_button_down() -> void:
	if transition:
		transition.transition(0)
		await transition.finish_transition
	get_tree().change_scene_to_file("res://menus/main_menu/main_menu.tscn")
