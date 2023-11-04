extends Node

signal time_update(timeInSeconds: int)

@export var currentTimeInSeconds: int = 0

func startTimer():
	$Timer.start()

func _on_timer_timeout():
	currentTimeInSeconds += 1
	time_update.emit(currentTimeInSeconds)
