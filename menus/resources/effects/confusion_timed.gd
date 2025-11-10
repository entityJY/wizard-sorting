extends TimedEffect
class_name ConfusionTimed

func timer_start():
    user_effects.confusion = 1000

func timer_end():
    user_effects.confusion = 0