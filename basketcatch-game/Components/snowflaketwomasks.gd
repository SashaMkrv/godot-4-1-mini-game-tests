extends Node2D

class_name SnowflakePro

@export var speed: int = 100
@export var moving: bool = true

@export var deadAreas: Array[Area2D]
@export var liveAreas: Array[Area2D]

signal is_caught(snowflake: SnowflakePro)

func _ready():
	setAlive()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not moving:
		return
	var direction = Vector2.DOWN
	var velocity = delta * direction * speed
	position += velocity


func _on_playercheck_area_entered(area : Area2D) -> void:
	setCaught()

func _on_snowcheck_area_entered(area : Area2D) -> void:
	print_debug(area.name)
	setDead()


func setDead() -> void:
	setAllMonitoringTo(liveAreas, false)
	setAllMonitoringTo(deadAreas, true)
	moving = false
	pass

func setAlive() -> void:
	setAllMonitoringTo(liveAreas, true)
	setAllMonitoringTo(deadAreas, false)
	moving = true
	pass

func setCaught() -> void:
	is_caught.emit(self)

func setAllMonitoringTo(areas: Array[Area2D], state: bool) -> void:
	for area in areas:
		area.set_deferred("monitorable", state)
		area.set_deferred("monitoring", state)
#		area.monitoring = state
#		area.monitorable = state
