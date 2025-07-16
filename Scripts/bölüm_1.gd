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
	
	var karakter_sahne = preload("res://Sahneler/blok.tscn")

	# 2. Yeni bir kopyasını oluştur
	var yeni_karakter = karakter_sahne.instantiate()

	# 4. İsteğe bağlı: ismini değiştir
	yeni_karakter.position = Vector2(100,100)
	yeni_karakter.name = "PlayerClone"
	add_child(yeni_karakter)

	# 5. Ana sahneye ekle
	
	#github deneme
	

func _physics_process(delta: float) -> void:
	bg1.position.x -= hiz
	bg2.position.x -= hiz
	if bg1.position.x < -600:
		bg1.position.x = 1790
		
	elif bg2.position.x < -600:
		bg2.position.x = 1790
		
	g1.position.x -= hiz*3
	g2.position.x -= hiz*3
	if g1.position.x < -600:
		g1.position.x = 1790
		
	elif g2.position.x < -600:
		g2.position.x = 1790
