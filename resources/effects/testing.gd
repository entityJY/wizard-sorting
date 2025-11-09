extends Effect
class_name Testing

func on_discard(_user_effects: UserEffects):
	print("This was discarded")

func on_sort(_user_effects: UserEffects):
	print("This was sorted")
