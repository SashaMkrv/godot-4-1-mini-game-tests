extends Control

@onready var ui: BasketGameUI = $UI
@export var game: Node

var isGamePaused: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pauseGame(isGamePaused)

func pauseGame(paused: bool) -> void:
	isGamePaused = paused
	if paused:
		game.process_mode = Node.PROCESS_MODE_DISABLED
	else:
		game.process_mode = Node.PROCESS_MODE_INHERIT
	ui.showPauseMenu(isGamePaused)

func _on_basketcatchgame_event_happened(event: BasketCatchGameEvent) -> void:
	if event is BasketGameScoreUpdatedEvent:
		var str = event.getScoreString()
		ui.updateScore(str)
		ui.updateEndScoreLabel(str)
	if event is BasketGameTimeUpdatedEvent:
		ui.updateTime(event.getTimeDownString())
	if event is BasketGameGameEndedEvent:
		gameEnded()

func gameEnded() -> void:
	ui.showEndGame()
	isGamePaused = true
	pauseGame(isGamePaused)

func pauseButtonPressed() -> void:
	print_debug("paused button event makes it")
	pauseHandler()

func pauseHandler() -> void:
	isGamePaused = !isGamePaused
	pauseGame(isGamePaused)

func continueGamePressed() -> void:
	pauseHandler()

func creditsButtonPressed() -> void:
	ui.showCredits()
	# why am I letting the credits menu handle itself
	# but nothing else??? shouldn't I be stacking these????
	# soemthing??? anything??? some kind of consistency????

func optionsButtonPressed() -> void:
	ui.showOptions()
	# the sins continue.

func exitGamePressed() -> void:
	print_debug("I can't let you do that hal :(")

func restartGamePressed() -> void:
	print_debug("please implement a restart.")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		pauseButtonPressed()
		get_viewport().set_input_as_handled()
		#if you need to unhandle this sometimes...
		# uh. well. figure out a new flow. I guess. :(
		#also, I have broken the built in keyboard nav thing.
		# how.
		# oh! I just need to focus on something. ok :)

func _on_ui_pause_putton_pressed():
	pauseButtonPressed()

func _on_ui_exit_game_pressed():
	exitGamePressed()

func _on_ui_credits_pressed():
	creditsButtonPressed()

func _on_ui_restart_pressed():
	restartGamePressed()

func _on_ui_continue_pressed():
	continueGamePressed()

func _on_ui_options_pressed():
	optionsButtonPressed()
