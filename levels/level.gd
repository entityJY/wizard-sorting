extends Node2D


@export var unsorted_stack: Array[Item]
var left_stack: Array[Item]
var right_stack: Array[Item]
var discard_stack: Array[Item]


func _process(_delta):
	if Input.is_action_just_pressed("left"):
		var item = unsorted_stack.pop_front()
		item.on_sort()
		left_stack.append(item)
	if Input.is_action_just_pressed("right"):
		var item = unsorted_stack.pop_front()
		item.on_sort()
		right_stack.append(item)
	if Input.is_action_just_pressed("down"):
		var item = unsorted_stack.pop_front()
		item.on_discard()
		discard_stack.append(item)
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
