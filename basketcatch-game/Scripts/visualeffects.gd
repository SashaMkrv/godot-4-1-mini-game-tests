extends Node

class_name VfxHandler

@export var snowflakeCatchEventEffect: PackedScene

func handleGameEvent(event: BasketCatchEvent) -> void:
	if event is SnowflakeCatchEvent:
		var effect = snowflakeCatchEventEffect.instantiate()
		var particles = effect as GPUParticles2D
		var snowflake = event.snowflake
		var locParent = snowflake.get_parent() as Node2D
		print_debug(event)
		locParent.add_child(particles)
		particles.position = event.position
		particles.restart()
		particles.emitting = true
		get_tree().create_timer(
			particles.lifetime, false
		).connect(
			"timeout", particles.queue_free
		)

func _on_eventlistener_event_happened(event: BasketCatchEvent) -> void:
	handleGameEvent(event)
