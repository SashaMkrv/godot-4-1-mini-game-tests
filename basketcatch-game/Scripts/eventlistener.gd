extends Node

class_name BasketEventListener

signal event_happened(event: BasketCatchEvent)

func listenEvent(event: BasketCatchEvent) -> void:
	event_happened.emit(event)
