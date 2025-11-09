extends Effect
class_name TimedEffect


signal create_timer(duration: float, effect: TimedEffect)
@export var duration: float


func effect():
    create_timer.emit(duration, self)
    timer_start()

func timer_start():
    pass

func timer_end():
    pass