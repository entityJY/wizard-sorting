extends Sprite2D
class_name ItemScene


@export var target_position: Vector2
var SPEED = 10
var sorted: bool = false

func _init(sprite: Resource):
	texture = sprite

func _process(delta):
	if sorted and abs(global_position.x-target_position.x) < 1:
		global_position = global_position.lerp(Vector2(target_position.x, target_position.y), SPEED*delta)
	global_position = global_position.lerp(Vector2(target_position.x, global_position.y), SPEED*delta)
