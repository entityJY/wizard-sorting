extends Resource
class_name Item

@export var attributes: Array[String]
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

func set_attached_target(target: Vector2):
	if attached_node:
		attached_node.target_position = target
