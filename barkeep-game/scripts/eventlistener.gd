extends Node

signal use_event(event: BarEvent)

@export var moveSuccess: BarEvent
@export var moveFailure: BarEvent
@export var glassMove: BarEvent
@export var gameStart: BarEvent

var onUpdate: BarEvent


func _on_playermover_player_moved(success: bool) -> void:
	if success:
		use_event.emit(moveSuccess)
	else:
		use_event.emit(moveFailure)

func _on_counterprovider_out_of_range_of_counters():
	use_event.emit(moveFailure)


func _on_playermover_player_start():
	use_event.emit(gameStart)
