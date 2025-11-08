extends Node2D

# right now, I have the stacks pointing to actual nodes in the scene, but that isn't really necesary, you could instead maybe just keep an in code list, or use some other implementation
@export var unsorted_stack: Node2D
@export var left_stack: Node2D
@export var right_stack: Node2D
@export var discard_stack: Node2D

# Contains (3?) variables: left stack, right stack, and unsorted stack (maybe include discard stack?)
# on left/right, sort the first item in unsorted stack into left/right stack
#   run on_sort function on sorted item
# on discard, sort into discard stack
#   run on_discard function of discarded item