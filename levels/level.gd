extends Node2D


@export var unsorted_stack: Array[Item]
var left_stack: Array[Item]
var right_stack: Array[Item]
var discard_stack: Array[Item]
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
		unsorted_stack[0].on_enter_active_sort()
	if right:
		var item = unsorted_stack.pop_front()
		item.on_sort(user_effects)
		right_stack.append(item)
		unsorted_stack[0].on_enter_active_sort()
	if down:
		var item = unsorted_stack.pop_front()
		item.on_discard(user_effects)
		discard_stack.append(item)
		unsorted_stack[0].on_enter_active_sort()
	if unsorted_stack.is_empty():
		calculate_score()

func calculate_score():
	# needs finishing
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
