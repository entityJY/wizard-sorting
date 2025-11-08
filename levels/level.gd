extends Node2D

# feel free to change whatever you want in this file, I'm still trying to figure out a good implementation


@export var unsorted_stack: Node2D
var left_stack: Array[Item]
var right_stack: Array[Item]
var discard_stack: Array[Item]

# Contains (3?) variables: left stack, right stack, and unsorted stack (maybe include discard stack?)
# on left/right, sort the first item in unsorted stack into left/right stack
#   run on_sort function on sorted item
# on discard, sort into discard stack
#   run on_discard function of discarded item