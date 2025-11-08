extends TextureRect

@export var left_side = true
@export var attributes: Array[String]
@export var effects: Array[Effect]

func on_sort():
    for effect in effects:
        effect.on_sort()

func on_discard():
    for effect in effects:
        effect.on_discard()