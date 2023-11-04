extends Node2D

class_name BarCounter

@export var speedMultiplier: float = 1.0

func provideSpawnPoint() -> Node2D:
	return $spawnpoint
