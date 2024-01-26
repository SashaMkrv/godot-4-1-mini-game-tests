extends BasketCatchEvent

class_name BasketScoreModificationEvent

var scoreMod: int

func _init(_scoreMod: int):
	scoreMod = _scoreMod


func getScoreModification() -> int:
	return scoreMod
