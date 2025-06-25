extends Node2D

var hiz = 10
var bg1 = Sprite2D
var bg2 = Sprite2D

	
func _ready() -> void:
	bg1 = $"Bg04-hd"
	bg2 = $"Bg04-hd2"

func _physics_process(delta: float) -> void:
	
	bg1.position.x -= hiz
	bg2.position.x -= hiz
	
	if bg1.position.x < -600:
		bg1.position.x = 1790
	elif bg2.position.x < -600:
		bg2.position.x = 1790
