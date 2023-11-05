extends Node2D

class_name SpawnLocationProvider

@onready var spawnLine: Line2D = $spawnline

func getRandomLocation() -> Vector2:
	var start = spawnLine.points[0]
	var end = spawnLine.points[-1]
	
	var randomx = randi_range(start.x, end.x)
	var randomy = randi_range(start.y, end.y)
	
	return Vector2(randomx, randomy)
