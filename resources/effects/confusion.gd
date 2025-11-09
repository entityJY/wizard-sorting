extends Effect
class_name Confusion

@export var duration: int

func effect(user_effects: UserEffects):
	user_effects.confusion = duration
