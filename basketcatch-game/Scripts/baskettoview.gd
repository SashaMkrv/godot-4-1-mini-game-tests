extends Control

@onready var ui: BasketGameUI = $UI

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_basketcatchgame_event_happened(event: BasketCatchGameEvent) -> void:
	if event is BasketGameScoreUpdatedEvent:
		ui.updateScore(event.getScoreString())
	if event is BasketGameTimeUpdatedEvent:
		ui.updateTime(event.getTimeDownString())
