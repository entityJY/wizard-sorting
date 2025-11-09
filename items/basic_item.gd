extends Resource
class_name Item


enum Attributes {
	CUT,
	BLUNT,
	PIERCE,
	POTION,
	BLUE,
	RED,
	DISCARD,
}


@export var attributes: Array[Attributes]
@export var effects: Array[Effect]
@export var sprite: Texture2D
var attached_node: ItemScene = null

func on_sort(user_effects: UserEffects):
	for effect in effects:
		effect.on_sort(user_effects)

func on_discard(user_effects: UserEffects):
	for effect in effects:
		effect.on_discard(user_effects)

func on_enter_active_sort(user_effects: UserEffects):
	for effect in effects:
		effect.on_enter_active_sort(user_effects)


func calculate_path_attached(target: Vector2) -> void:
	if attached_node:
		attached_node.calculate_new_path(target)

func add_attached_target(target: Vector2) -> void:
	if attached_node:
		attached_node.add_target_position(target)