extends Node2D

@export_range(0, 1) var spawnChance: float = 0.8 # chance of spawning over a second

@export var spawner: SpawnLocationProvider

@export var snowflakeScene: PackedScene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var randfloat = randf()
	var comparator = spawnChance * delta
	if randfloat < comparator:
		print_debug("we succeeded")
		spawnSnowflakeAtRandomLocation()
		return
#	print_debug("oh oh.")

func _on_snowflake_is_caught(snowflake: SnowflakePro) -> void:
	snowflakeCatch(snowflake)

func snowflakeCatch(snowflake: SnowflakePro) -> void:
	print_debug("Caught snowflake!")
	snowflake.queue_free()
	# play fun particle explosion where the snowflake was when it was caught

func spawnSnowflakeAtRandomLocation() -> void:
	var location = spawner.getRandomLocation()
	spawnSnowflakeAt(location)
	# get a spot on the spawn line to chuck a snowflake at

func spawnSnowflakeAt(newLocation: Vector2) -> void:
	var snowflake = snowflakeScene.instantiate()
	snowflake.position = newLocation
	add_child(snowflake)
