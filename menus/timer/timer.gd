extends CanvasGroup

@export var timer: Timer
@export var text_label: RichTextLabel

func _process(_delta):
	text_label.text = str(snappedf(timer.time_left, .01))
