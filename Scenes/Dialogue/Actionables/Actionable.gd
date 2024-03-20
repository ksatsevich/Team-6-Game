extends Area2D

const Balloon = preload("res://Scenes/Dialogue/balloon.tscn")

@export var dialogue_resourece: DialogueResource
@export var dialogue_start: String = "start"


func action() -> void:
	var Balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(Balloon)
	Balloon.start(dialogue_resourece, dialogue_start)
