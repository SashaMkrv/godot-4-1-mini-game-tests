extends Control

class_name BasketGameUI

@export var scoreLabel: Label
@export var timeLabel: Label

@export var pauseButton: Button

func updateScore(score: String) -> void:
	scoreLabel.text = score

func updateTime(time: String) -> void:
	timeLabel.text = time
