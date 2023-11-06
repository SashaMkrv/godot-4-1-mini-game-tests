extends Control

func hide_me() -> void:
	hide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") && visible:
		hide_me()
		print_debug("I am trying to hide myself and consume an event")
		get_viewport().set_input_as_handled()
		#if we're lucky this somehow won't be a problem.
		# and anything that wants to use esc will mark it as handled 
