extends Node2D

class_name SpawnLocationProvider

@onready var spawnLine: Line2D = $spawnline

func getRandomLocation() -> Vector2:
	var mod = spawnLine.global_position - spawnLine.position
	var start = spawnLine.points[0] + mod
	var end = spawnLine.points[-1] + mod
	
	var randomx = randi_range(start.x, end.x)
	var randomy = randi_range(start.y, end.y)
	
	return Vector2(randomx, randomy)
