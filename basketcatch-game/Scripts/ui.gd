extends Control

class_name BasketGameUI

@export var scoreLabel: Label
@export var timeLabel: Label

@export var pauseButton: Button

@export var pauseMenu: Control
@export var credits: Control

signal pause_putton_pressed
signal exit_game_pressed
signal restart_pressed
signal credits_pressed
signal continue_pressed

func updateScore(score: String) -> void:
	scoreLabel.text = score

func updateTime(time: String) -> void:
	timeLabel.text = time

func togglePauseMenu() -> void:
	pauseMenu.visible = ! pauseMenu.visible
	
func showPauseMenu(state: bool) -> void:
	pauseMenu.visible = state

func pauseButtonPressed() -> void:
	pause_putton_pressed.emit()

func showCredits() -> void:
	credits.visible = true

func creditsButtonPressed() -> void:
	credits_pressed.emit()

func restartPressed() -> void:
	restart_pressed.emit()

func exitGamePressed() ->  void:
	exit_game_pressed.emit()

func continueButtonPressed() -> void:
	continue_pressed.emit()

func _on_pausebutton_pressed():
	pauseButtonPressed()

func _on_creditsbutton_pressed():
	creditsButtonPressed()

func _on_restartgamebutton_pressed():
	restartPressed()

func _on_exitgamebutton_pressed():
	exitGamePressed()

func _on_continuegamebutton_pressed():
	continueButtonPressed()
