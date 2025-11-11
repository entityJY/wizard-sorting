extends Resource
class_name ItemStack

@export var item_stack: Array[Item]
@export var randomized_order: bool = false

func _init(items: Array[Item] = [], p_randomized_order = false):
    item_stack = items
    randomized_order = p_randomized_order
    if randomized_order:
        item_stack.shuffle()

func pop_front() -> Item:
    return item_stack.pop_front()

func is_empty() -> bool:
    return item_stack.is_empty()
