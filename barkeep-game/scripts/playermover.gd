extends Node

class_name BarPlayerMover

@export var counterProvider: BarCounterProvider
@export var player: BarPlayer
signal player_moved(success: bool)
signal player_start()

func _ready() -> void:
	moveToNext(BarCounterProvider.directions.START, false)
	player_start.emit()

func moveToNext(direction: BarCounterProvider.directions, soundOnMove: bool = true) -> void:
	var counter := counterProvider.provideNextCounter(
		player.currentCounter,
		direction
	)
	
	var move := player.moveToCounter(
		counter
	)
	
	if move && soundOnMove:
		player_moved.emit(true)

func getDirectionForInput(event: InputEvent) -> BarCounterProvider.directions:
	if event.is_echo():
		return BarCounterProvider.directions.NONE
		#now if only I could remember how cases worked
	if event.is_action_pressed("ui_down"):
		return BarCounterProvider.directions.DOWN
	if event.is_action_pressed("ui_up"):
		return BarCounterProvider.directions.UP
	if event.is_action_pressed("ui_right"):
		return BarCounterProvider.directions.RIGHT
	if event.is_action_pressed("ui_left"):
		return BarCounterProvider.directions.LEFT
	return BarCounterProvider.directions.NONE

func _unhandled_key_input(event: InputEvent):
	moveToNext(getDirectionForInput(event), true)
