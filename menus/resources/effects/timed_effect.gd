extends Effect
class_name TimedEffect


signal create_timer(duration: float, effect: TimedEffect)
@export var duration: float


func effect():
    create_timer.emit(duration, self)
    timer_start()


## Effect to run when timer starts
func timer_start():
    pass

## Effect to run when timer ends
func timer_end():
    pass