extends Node

class_name BasketGameEventPropogator

@export var eventListeners: Array[BasketEventListener]

signal event_happened(event: BasketCatchGameEvent)

func eventHappened(event: BasketCatchEvent) -> void:
	for listener in eventListeners:
		listener.listenEvent(event)

func emitGameEvent(event: BasketCatchGameEvent) -> void:
	event_happened.emit(event)
