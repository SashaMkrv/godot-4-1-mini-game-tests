extends BasketCatchGameEvent

class_name BasketGameTimeUpdatedEvent

var time: int
var maxTime: int

func _init(_time: int, _maxTime: int):
	time = _time
	maxTime = _maxTime

func getTimeUpString() -> String:
	return String.num_int64(time)

func getTimeDownString() -> String:
	return String.num_int64(maxTime - time)
