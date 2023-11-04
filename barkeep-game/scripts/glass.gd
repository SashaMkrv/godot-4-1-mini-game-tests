extends Node2D

class_name BarGlass

signal glass_caught(glass: BarGlass)

@export var speed: float = 20.0
@export var direction: Vector2 = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	position += speed * direction * delta

func _on_glasscollision_area_entered(area: Area2D) -> void:
	if area.is_in_group("catch"):
		glass_caught.emit(self)

