extends Node2D

class_name Snowflake

@export var speed: int = 100
@export var moving: bool = true

@onready var areanode: Area2D = $Area2D

signal is_caught(snowflake: Snowflake)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not moving:
		return
	var direction = Vector2.DOWN
	var velocity = delta * direction * speed
	position += velocity


func _on_area_2d_area_entered(area : Area2D) -> void:
	if area.is_in_group("snowflake"):
		setDead()
	elif area.is_in_group("despawn"):
		setDead()
	elif area.is_in_group("player"):
		setCaught()

func setDead() -> void:
	setCollisionLayerTo(1, false)
	setCollisionLayerTo(2, true)
	setCollisionMaskTo(1, false)
	setCollisionMaskTo(2, false)
	moving = false
	pass

func setAlive() -> void:
	setCollisionLayerTo(1, false)
	setCollisionLayerTo(2, false)
	setCollisionMaskTo(1, true)
	setCollisionMaskTo(2, true)
	moving = true
	pass

func setCaught() -> void:
	is_caught.emit(self)


func setCollisionLayerTo(layer: int, status: bool) -> void:
	areanode.set_collision_layer_value(layer, status)

func setCollisionMaskTo(layer: int, status: bool) -> void:
	areanode.set_collision_mask_value(layer, status)
