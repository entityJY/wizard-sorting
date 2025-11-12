extends CanvasLayer

@export var next_level: PackedScene
signal level_one_complete(score: int)

func _ready():
	if !next_level:
		$ScoreBackground/Continue.visible = false

func _on_level_1_level_complete(total_score: int, _completed_all_stacks: bool) -> void:
	level_one_complete.emit(total_score)

func _on_continue_button_down() -> void:
	get_tree().change_scene_to_packed(next_level)
