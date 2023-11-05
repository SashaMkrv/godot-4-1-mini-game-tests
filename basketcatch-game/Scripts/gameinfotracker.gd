extends Node

signal event_happened(event: BasketCatchGameEvent)

var currentScore: int = 0

func handleEvent(event: BasketCatchEvent) -> void:
	if event is SnowflakeCatchEvent:
		currentScore += 1
		event_happened.emit(BasketGameScoreUpdatedEvent.new(currentScore))

func _on_eventlistener_event_happened(event: BasketCatchEvent) -> void:
	handleEvent(event)
