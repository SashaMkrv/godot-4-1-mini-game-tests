extends Node

var secondsElapsed: int

signal event_happened(event: BasketCatchGameEvent)

@export var maxTime: int = 100

func _ready() -> void:
	startTimer()

func increaseTime() -> void:
	secondsElapsed += 1
	var event = BasketGameTimeUpdatedEvent.new(secondsElapsed, maxTime)
	event_happened.emit(event)

func _on_timer_timeout() -> void:
	increaseTime()

func startTimer():
	$Timer.start()
