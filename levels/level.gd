extends Node2D


@export var stacks: Array[ItemStack]
var unsorted_stack: ItemStack
var left_stack: Array[Item]
var right_stack: Array[Item]
var discard_stack: Array[Item]

var user_effects: UserEffects = UserEffects.new()

var left_target: Vector2
var right_target: Vector2

@export var stack_timer: Timer

var between_stacks: bool = false

signal stack_sorted(score: int)
var total_score: int = 0
signal level_complete(total_score: int)


func _ready():
	start_level()

func _process(_delta):

	if between_stacks:
		return

	var left = Input.is_action_just_pressed("left")
	var right = Input.is_action_just_pressed("right")
	var down = Input.is_action_just_pressed("down")

	if (user_effects.confusion > 0):
		left = Input.is_action_just_pressed("right")
		right = Input.is_action_just_pressed("left")
	
	if left:
		var item = unsorted_stack.pop_front()
		item.on_sort(user_effects)
		left_target.y -= item.sprite.get_height()/2
		item.calculate_path_attached(left_target)
		left_target.y -= item.sprite.get_height()/2
		left_stack.append(item)
	
	if right:
		var item = unsorted_stack.pop_front()
		item.on_sort(user_effects)
		right_target.y -= item.sprite.get_height()/2
		item.calculate_path_attached(right_target)
		right_target.y -= item.sprite.get_height()/2
		right_stack.append(item)
	
	if down:
		var item = unsorted_stack.pop_front()
		item.on_discard(user_effects)
		item.add_attached_target(Vector2(0, 600))
		discard_stack.append(item)
		
	if left or right or down:
		if not unsorted_stack.is_empty():
			unsorted_stack.item_stack[0].on_enter_active_sort(user_effects)
	
	if unsorted_stack.is_empty():
		calculate_score()


func sort_dict(a: String, b: String, dict: Dictionary):
	return true if dict[a] > dict[b] else false

func calculate_score():
	if between_stacks: return

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
	if len(left_keys) != 0 and len(right_keys) != 0:
		# actual scoring
		@warning_ignore("integer_division")
		score = (len(left_stack) + len(right_stack)) / 2
		for item in left_stack:
			if not left_keys[0] in item.attributes or not Item.Attributes.DISCARD in item.attributes:
				score -= 1
		for item in right_stack:
			if not right_keys[0] in item.attributes or not Item.Attributes.DISCARD in item.attributes:
				score -= 1
		for item in discard_stack:
			if Item.Attributes.DISCARD in item.attributes:
				score += 1
	
	stack_timer.start()
	total_score += score
	stack_sorted.emit(score)
	between_stacks = true


func start_level():
	between_stacks = false

	# reset target_positions
	left_target = $LeftStack.global_position
	right_target = $RightStack.global_position

	# get next stack
	var starting_stack = stacks.pop_front()

	# instantiate next stack of items
	var item_array: Array[Item]
	for item in starting_stack.item_stack:
		item_array.append(item.duplicate())
	unsorted_stack = ItemStack.new(item_array, starting_stack.randomized_order)
	
	# create ItemScene items
	var start_position: Vector2 = $ItemStack.global_position
	var prev_height: int = 0
	unsorted_stack.item_stack.reverse()
	for item in unsorted_stack.item_stack:
		@warning_ignore("integer_division")
		start_position.y -= (item.sprite.get_height() + prev_height) / 2
		var scene: ItemScene = ItemScene.new(item.sprite)
		scene.global_position = start_position
		scene.global_position.y -= 2000
		scene.set_target_positions([start_position])
		item.attached_node = scene
		$InstantiatedItems.add_child(scene)
		prev_height = item.sprite.get_height()
	unsorted_stack.item_stack.reverse()


func _on_stack_timer_timeout():
	# move items into holes
	for item in left_stack:
		item.add_attached_target(Vector2(left_target.x, $LeftStack.global_position.y + 700))
	for item in right_stack:
		item.add_attached_target(Vector2(right_target.x, $RightStack.global_position.y + 700))
	
	# start next stack or complete level
	if not stacks.is_empty():
		start_level()
	else:
		level_complete.emit(total_score)
		print("Level Complete! Total Score: ")
		print(total_score)
