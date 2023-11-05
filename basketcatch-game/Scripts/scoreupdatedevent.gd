extends BasketCatchGameEvent

class_name BasketGameScoreUpdatedEvent

var score: int

func _init(_score: int):
	score = _score

func getScoreString() -> String:
	return String.num_int64(score)
