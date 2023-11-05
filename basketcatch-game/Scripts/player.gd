extends CharacterBody2D


@export var speed: int = 10000 # (this number sucks, actually)

func _physics_process(delta: float) -> void:
	var strength := Input.get_axis("ui_left", "ui_right")
	velocity = strength * Vector2.RIGHT * speed * delta
	
	#doing this every update is terrible! excellent.
	
	if velocity.x < 0:
		$playershape.scale.x = abs($playershape.scale.x) * -1
	elif velocity.x > 0:
		$playershape.scale.x = abs($playershape.scale.x)
	
	move_and_slide()
