extends Camera2D

@onready var player = $"../TileMap/Player"
@export var player2 : Node

func _process(_delta):
		position = player2.global_position
