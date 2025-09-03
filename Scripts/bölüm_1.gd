extends Node2D

var hiz = 5
var bg1 = Sprite2D
var bg2 = Sprite2D
var g1 = Sprite2D
var g2 = Sprite2D

var sivri_blok_sayi = 0
var blok_sayi = 0
var cukur_blok_sayi = 0
func _ready() -> void:
	
	$Player.get_node("karakterler").frame = Ortak.frame
	$Player.get_node("ColorRect").color = Ortak.color
	$Player.get_node("CPUParticles2D").color = Ortak.color
	
	if Ortak.volume > -80:
		
		$AudioStreamPlayer.volume_db = Ortak.volume
		$AudioStreamPlayer.play()
	
	
	bg1 = $"Bg04-hd"
	bg2 = $"Bg04-hd2"
	g1=$ground1
	g2=$ground2
	
	
	"""
	for i in range(1,8):
		
		var yeni_karakter = $blok.duplicate()
		yeni_karakter.position = Vector2(1000 + i*60,400)
		yeni_karakter.name = "blok" + str(i)
		add_child(yeni_karakter)
	"""
	
	var parent = $"."
	
	for child in parent.get_children():
		if child.name.begins_with("sivri_blok"):
			sivri_blok_sayi += 1
		if child.name.begins_with("cukur_blok"):
			cukur_blok_sayi += 1
		if child.name.begins_with("blok"):
			blok_sayi += 1
			
	print("Sivri engel sayısı: ", sivri_blok_sayi)
	print("Çukur engel sayısı: ", cukur_blok_sayi)
	print("engel sayısı: ", blok_sayi)

	
	

	

func _physics_process(delta: float) -> void:
		
		
	_sabit_hızda_hareket(g1, hiz*3)
	_sabit_hızda_hareket(g2, hiz*3)
	_sabit_hızda_hareket(bg1, hiz)
	_sabit_hızda_hareket(bg2, hiz)
	
	for i in range(1,blok_sayi+1):
		if get_node("blok"+str(i)) != null:
			_sabit_hızda_hareket2(get_node("blok"+str(i)),hiz*1.5)
	for i in range(1,sivri_blok_sayi+1):
		if get_node("sivri_blok"+str(i)) != null:
			_sabit_hızda_hareket2(get_node("sivri_blok"+str(i)),hiz*1.5)
	for i in range(1,cukur_blok_sayi+1):
		if get_node("cukur_blok"+str(i)) != null:
			_sabit_hızda_hareket2(get_node("cukur_blok"+str(i)),hiz*1.5)
	

	
func _sabit_hızda_hareket(karakter:Sprite2D, hiz:float):
	karakter.position.x -= hiz
	if karakter.position.x < -600:
		karakter.position.x = 1790
	
func _sabit_hızda_hareket2(karakter:CharacterBody2D, hiz:float):
	if karakter !=null:
		karakter.position.x -= hiz
		if karakter.position.x < -600:
			remove_child(karakter)
	
