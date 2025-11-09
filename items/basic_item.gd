extends Resource
class_name Item

@export var attributes: Array[String]
@export var effects: Array[Effect]
@export var sprite: Resource

func on_sort(user_effects: UserEffects):
	for effect in effects:
		effect.on_sort(user_effects)

func on_discard(user_effects: UserEffects):
	for effect in effects:
		effect.on_discard(user_effects)
