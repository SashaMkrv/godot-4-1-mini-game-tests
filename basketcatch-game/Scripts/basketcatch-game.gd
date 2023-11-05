extends Node

@onready var gameLogic: BasketGameLogic = $gamelogic

signal event_happened(event: BasketCatchGameEvent)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_projectiles_snowflake_caught(snowflake: SnowflakePro) -> void:
	var event := SnowflakeCatchEvent.new(snowflake)
#	event_happened.emit(event)
	gameLogic.eventHappened(event)


func _on_gamelogic_event_happened(event: BasketCatchGameEvent) -> void:
	event_happened.emit(event)
