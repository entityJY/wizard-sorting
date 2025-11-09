extends Resource
class_name Effect


enum effect_target {
	DISCARD,
	SORT,
	ACTIVE,
}
@export var target: effect_target

func on_discard(user_effects: UserEffects):
	if target == effect_target.DISCARD:
		effect(user_effects)

func on_sort(user_effects: UserEffects):
	if target == effect_target.SORT:
		effect(user_effects)

func on_enter_active_sort(user_effects: UserEffects):
	if target == effect_target.ACTIVE:
		effect(user_effects)

func effect(_user_effects: UserEffects):
	pass
