extends Node

class_name BarCounterProvider

signal out_of_range_of_counters

enum directions {
	UP,
	DOWN,
	RIGHT,
	LEFT,
	START,
	NONE
}

@export var counters: Array[BarCounter]
@export var defaultCounter : BarCounter


func provideNextCounter(currentCounter: BarCounter, direction: directions) -> BarCounter:
	if direction == directions.START:
		return defaultCounter
	
	if currentCounter not in counters:
		return currentCounter
		
	var index = counters.find(currentCounter)
	var newIndex = index
	
	
	match direction:
		directions.UP:
			newIndex -= 1
		directions.DOWN:
			newIndex += 1
		directions.NONE:
			return currentCounter
		_: 
			badMove()
		
	
	var clampedNewIndex = clamp(newIndex, 0, counters.size() - 1)
	
	if newIndex != clampedNewIndex:
		badMove()
	
	return counters[clampedNewIndex]


func badMove() -> void:
	out_of_range_of_counters.emit()
