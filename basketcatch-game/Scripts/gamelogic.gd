extends Node

class_name BasketGameLogic

@export var eventListeners: Array[BasketEventListener]

signal event_happened(event: BasketCatchGameEvent)

func eventHappened(event: BasketCatchEvent) -> void:
	for listener in eventListeners:
		listener.listenEvent(event)

func emitGameEvent(event: BasketCatchGameEvent) -> void:
	event_happened.emit(event)

func _on_scorekeeper_event_happened(event: BasketCatchGameEvent) -> void:
	emitGameEvent(event)


func _on_timekeeper_event_happened(event: BasketCatchGameEvent) -> void:
	emitGameEvent(event)
