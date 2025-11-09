extends Node2D


@export var unsorted_stack: ItemStack
var left_stack: Array[Item]
var right_stack: Array[Item]
var discard_stack: Array[Item]

signal stack_sorted(score: int)
var user_effects: UserEffects = UserEffects.new()

func _process(_delta):
	var left = Input.is_action_just_pressed("left")
	var right = Input.is_action_just_pressed("right")
	var down = Input.is_action_just_pressed("down")

	if (user_effects.confusion > 0):
		left = Input.is_action_just_pressed("right")
		right = Input.is_action_just_pressed("left")
	
	if left:
		var item = unsorted_stack.pop_front()
		item.on_sort(user_effects)
		left_stack.append(item)
	
	if right:
		var item = unsorted_stack.pop_front()
		item.on_sort(user_effects)
		right_stack.append(item)
	
	if down:
		var item = unsorted_stack.pop_front()
		item.on_discard(user_effects)
		discard_stack.append(item)
		
	if left or right or down:
		if not unsorted_stack.is_empty():
			unsorted_stack.item_stack[0].on_enter_active_sort(user_effects)
	
	if unsorted_stack.is_empty():
		calculate_score()

func sort_dict(a: String, b: String, dict: Dictionary):
	return true if dict[a] > dict[b] else false

func calculate_score():
	var score = 0

	# get attributes
	var left_attributes = {}
	for item in left_stack:
		for attribute in item.attributes:
			var curr = left_attributes.get_or_add(attribute, 0)
			left_attributes[attribute] = curr + 1
	var right_attributes = {}
	for item in right_stack:
		for attribute in item.attributes:
			var curr = right_attributes.get_or_add(attribute, 0)
			right_attributes[attribute] = curr + 1

	# order keys
	var left_keys = left_attributes.keys()
	var right_keys = right_attributes.keys()
	left_keys.sort_custom(
		func (a, b):
			return sort_dict(a, b, left_attributes)
	)
	right_keys.sort_custom(
		func (a, b):
			return sort_dict(a, b, right_attributes)
	)

	# remove duplicate keys if they're both the greatest
	while true:
		if left_keys.is_empty() or right_keys.is_empty():
			break
		if left_keys[0] == right_keys[0]:
			left_keys.pop_front()
			right_keys.pop_front()
		else:
			break
	
	# check if keys are zero, return zero
	if len(left_keys) == 0 or len(right_keys) == 0:
		stack_sorted.emit(score)
		return

	# actual scoring
	@warning_ignore("integer_division")
	score = (len(left_stack) + len(right_stack)) / 2
	for item in left_stack:
		if not left_keys[0] in item.attributes:
			score -= 1
	for item in right_stack:
		if not right_keys[0] in item.attributes:
			score -= 1

	stack_sorted.emit(score)
