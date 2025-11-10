extends Level
class_name TimedLevel


enum TimedLevelStage {
    SETUP,
    PLAYING,
    FINISHED,
}

@export var level_time: float
## Time between level load and actual playing of the level
@export var setup_time: float
var level_started: TimedLevelStage = TimedLevelStage.SETUP
@export var level_timer: Timer


func _ready():
    get_tree().create_timer(setup_time).timeout.connect(start_level)
    level_timer.timeout.connect(level_timer_timeout)
    level_complete.connect(on_level_end)

func _process(delta):
    if level_started == TimedLevelStage.PLAYING:
        super(delta)

func start_level() -> void:
    start_stack()
    level_started = TimedLevelStage.PLAYING
    level_timer.start(level_time)

func level_timer_timeout() -> void:
    start_next_stack = false
    calculate_score()
    print("Level Complete! Total Score: ")
    print(total_score)
    level_complete.emit(total_score, false)

func on_level_end(_total_score, _completed_stacks) -> void:
    level_timer.stop()
    level_started = TimedLevelStage.FINISHED
