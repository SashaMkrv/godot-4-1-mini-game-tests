extends Node2D

class_name BarPlayer

@export var currentCounter: BarCounter
@export var nextCounter: BarCounter

func moveToCounter(counter: BarCounter) -> bool:
	if currentCounter == counter || nextCounter == counter || counter == null:
		return false
	
	nextCounter = counter
	return true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if nextCounter == null:
		return
	currentCounter = nextCounter
	nextCounter = null
	var spawnPoint = currentCounter.provideSpawnPoint()
	global_position = spawnPoint.global_position
