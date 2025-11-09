extends Sprite2D
class_name ItemScene


@export var target_position: Vector2
var SPEED = 10

func _init(sprite: Resource):
	texture = sprite

func _process(delta):
	global_position = global_position.lerp(Vector2(target_position.x, target_position.y), SPEED*delta)
