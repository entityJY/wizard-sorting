extends Resource
class_name Effect


enum effect_target {
	DISCARD,
	SORT,
	ACTIVE,
}
@export var target: effect_target
var user_effects: UserEffects = null

## Shader to apply to item
@export var shader: ShaderMaterial


func set_user_effects_ref(p_user_effects: UserEffects):
	user_effects = p_user_effects

func on_discard():
	assert(user_effects != null, "user_effects ref wasn't set!")
	if target == effect_target.DISCARD:
		effect()

func on_sort():
	assert(user_effects != null, "user_effects ref wasn't set!")
	if target == effect_target.SORT:
		effect()

func on_enter_active_sort():
	assert(user_effects != null, "user_effects ref wasn't set!")
	if target == effect_target.ACTIVE:
		effect()

## Effect to run
func effect():
	pass
