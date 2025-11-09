extends Effect
class_name ConfusionOnSort

@export var duration: int

func on_discard(_user_effects: UserEffects):
	pass

func on_sort(user_effects: UserEffects):
	user_effects.confusion = duration
