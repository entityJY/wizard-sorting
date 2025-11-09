extends Sprite2D
class_name ItemScene


@export var target_positions: Array[Vector2]
var SPEED = 10
var dis_for_complete = 0

func _init(sprite: Texture2D):
	texture = sprite
	@warning_ignore("integer_division")
	dis_for_complete = sprite.get_width()/2

func _process(delta):
	global_position = global_position.lerp(target_positions[0], SPEED*delta)
	if (global_position-target_positions[0]).length() < dis_for_complete and len(target_positions) > 1:
		target_positions.pop_front()


func calculate_new_path(target: Vector2) -> void:
	if target.y > global_position.y:
		add_target_position(Vector2(150 * sign(target.x), global_position.y))
	else:
		add_target_position(Vector2(200 * sign(target.x), target.y))
	add_target_position(target)

func add_target_position(target: Vector2) -> void:
	target_positions.append(target)

func set_target_positions(targets: Array[Vector2]) -> void:
	target_positions = targets
