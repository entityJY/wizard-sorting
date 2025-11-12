extends CanvasLayer
signal pack_up
signal transition

@export var transition_: Transition


func _ready():
	if transition:
		transition_.transition(1)

func _on_pack_up() -> void:
	$Music/button_press_sfx.play()
	for i in range(10):
		$Illustration.position = $Illustration.position.move_toward(Vector2(800, -197), 5 - float(i))
		$Title.position = $Title.position.move_toward(Vector2(117, 100), 5 - float(i))
		await get_tree().create_timer(0.05).timeout
	for i in range(40):
		$Illustration.position = $Illustration.position.move_toward(Vector2(2000, -197), 5 + float(i))
		$Title.position = $Title.position.move_toward(Vector2(117, -400), 5 + float(i))
		await get_tree().create_timer(0.02).timeout
