extends Resource
class_name UserEffects

@export var confusion: int

func decrement_effects() -> void:
	if confusion > 0:
		confusion -= 1 
