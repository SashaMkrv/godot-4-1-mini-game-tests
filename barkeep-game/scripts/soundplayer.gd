extends Node

@export var soundMappings: Array[BarEventSoundMap]

var soundMap: Dictionary

func _ready() -> void:
	for mapping in soundMappings:
		soundMap[mapping.event] = mapping.soundPlayer


func tryPlaySoundFor(event: BarEvent) -> void:
	if event in soundMap:
		var soundplayer = getPlayerForEvent(event)
		print_debug(soundplayer)
		print_debug($clickplayer)
		soundplayer.play()


func getPlayerForEvent(event: BarEvent) -> AudioStreamPlayer:
	var path := soundMap[event] as NodePath
	return self.get_node(path) as AudioStreamPlayer
		

func _on_eventfilterer_use_event(event: BarEvent) -> void:
	tryPlaySoundFor(event)
