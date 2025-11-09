extends Resource
class_name Item

@export var attributes: Array[String]
@export var effects: Array[Effect]
@export var sprite: Resource

func on_sort():
	for effect in effects:
		effect.on_sort()

func on_discard():
	for effect in effects:
		effect.on_discard()

func on_enter_active_sort():
	for effect in effects:
		effect.on_enter_active_sort()
