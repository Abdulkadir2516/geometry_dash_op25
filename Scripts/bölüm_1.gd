extends Node2D

var hiz = 5
var bg1 = Sprite2D
var bg2 = Sprite2D
var g1 = Sprite2D
var g2 = Sprite2D
var kutu = CharacterBody2D
func _ready() -> void:
	bg1 = $"Bg04-hd"
	bg2 = $"Bg04-hd2"
	g1=$ground1
	g2=$ground2
	
	
	for i in range(1,8):
		
		var yeni_karakter = $blok.duplicate()
		yeni_karakter.position = Vector2(1000 + i*60,400)
		yeni_karakter.name = "blok" + str(i)
		add_child(yeni_karakter)
	
	
	
	

	

func _physics_process(delta: float) -> void:
	
	#bg1.position.x -= hiz
	#bg2.position.x -= hiz
	#if bg1.position.x < -600:
		#bg1.position.x = 1790
		#
	#elif bg2.position.x < -600:
		#bg2.position.x = 1790
		
	#g1.position.x -= hiz*3
	#g2.position.x -= hiz*3
	#if g1.position.x < -600:
		#g1.position.x = 1790
		#
	#elif g2.position.x < -600:
		#g2.position.x = 1790
		
		
	_sabit_hızda_hareket(g1, hiz*3)
	_sabit_hızda_hareket(g2, hiz*3)
	_sabit_hızda_hareket(bg1, hiz)
	_sabit_hızda_hareket(bg2, hiz)
	
	for i in range(1,8):
		
		_sabit_hızda_hareket2(get_node("blok"+str(i)), hiz*1.5)
	
	
func _sabit_hızda_hareket(karakter:Sprite2D, hiz:float):
	karakter.position.x -= hiz
	if karakter.position.x < -600:
		karakter.position.x = 1790
	
func _sabit_hızda_hareket2(karakter:CharacterBody2D, hiz:float):
	karakter.position.x -= hiz
	if karakter.position.x < -600:
		karakter.position.x = 1790
	
