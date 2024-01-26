extends Node

func _on_eventlistener_event_happened(event: BasketCatchEvent) -> void:
	if event is BasketCheckForEndEvent:
		checkForEnd(event)


func checkForEnd(event: BasketCheckForEndEvent) -> void:
	pass
