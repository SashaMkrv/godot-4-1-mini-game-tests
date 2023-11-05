extends BasketCatchEvent

class_name SnowflakeCatchEvent

var snowflake: SnowflakePro
var position: Vector2 = Vector2.ZERO

func _init(_snowflake: SnowflakePro):
	snowflake = _snowflake
	position = snowflake.position

func getSnowflake() -> SnowflakePro:
	return snowflake


func getPosition() -> Vector2:
	if not snowflake.is_inside_tree():
		return position
	return snowflake.position
