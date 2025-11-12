extends Level
class_name EndlessLevel

enum TimedLevelStage {
	SETUP,
	PLAYING,
	FINISHED,
}

@export var level_time: float = 30
## Time between level load and actual playing of the level
@export var setup_time: float
var level_started: TimedLevelStage = TimedLevelStage.SETUP
@export var level_timer: Timer


func _ready():
	$Background.play()
	get_tree().create_timer(setup_time).timeout.connect(start_level)
	level_timer.timeout.connect(level_timer_timeout)
	level_complete.connect(on_level_end)
	stack_sorted.connect(add_time)

func _process(delta):
	if level_started == TimedLevelStage.PLAYING:
		super(delta)


func start_stack():
	get_tree().create_timer(.25).timeout.connect(extra_delay)

	# reset target_positions
	left_target = $LeftStack.global_position
	right_target = $RightStack.global_position

	# get next stack
	var starting_stack = stacks.pick_random()

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
		$InstantiatedItems.add_child(scene)
		scene.global_position = start_position
		scene.global_position.y -= 2000
		scene.set_target_positions([start_position])
		item.attached_node = scene
		if item.effects and item.effects[0] and item.effects[0].shader:
			scene.material = item.effects[0].shader
		# create timers for TimedEffects
		for effect in item.effects:
			effect.set_user_effects_ref(user_effects)
			if effect is TimedEffect:
				effect.create_timer.connect(scene._start_effect_timer)

		prev_height = item.sprite.get_height()
	
	# unsorted_stack.item_stack.reverse()

	# activate on_active effect of first item
	unsorted_stack.item_stack[0].on_enter_active_sort()

	left_stack.clear()
	right_stack.clear()
	discard_stack.clear()


func add_time(score: int) -> void:
	var extra_time = float(score)
	level_timer.start(level_timer.time_left + extra_time)

func start_level() -> void:
	start_stack()
	level_started = TimedLevelStage.PLAYING
	level_timer.start(level_time)

func level_timer_timeout() -> void:
	start_next_stack = false
	# move items into holes
	for item in left_stack:
		item.add_attached_target(Vector2(left_target.x, $LeftStack.global_position.y + 700))
	for item in right_stack:
		item.add_attached_target(Vector2(right_target.x, $RightStack.global_position.y + 700))
	calculate_score()
	level_complete.emit(total_score, false)

func on_level_end(_total_score, _completed_stacks) -> void:
	level_timer.stop()
	level_started = TimedLevelStage.FINISHED
	print("Level Complete! Total Score: ")
	print(total_score)
