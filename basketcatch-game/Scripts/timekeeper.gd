extends Node

var secondsElapsed: int

signal event_happened(event: BasketCatchGameEvent)

@export var maxTime: int = 100

@onready var timer: Timer = $Timer

func _ready() -> void:
	startTimer()

func increaseTime() -> void:
	secondsElapsed += 1
	var event = BasketGameTimeUpdatedEvent.new(secondsElapsed, maxTime)
	event_happened.emit(event)
	emitIfTimesUp(secondsElapsed, maxTime)


func emitIfTimesUp(time: int, maxTime: int) -> void:
	if time >= maxTime:
		event_happened.emit(BasketGameGameEndedEvent.new())

func _on_timer_timeout() -> void:
	increaseTime()

func startTimer():
	timer.start()

func stopTimer():
	timer.stop()
