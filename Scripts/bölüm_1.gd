extends Node2D

var hiz = 5
var bg1 = Sprite2D
var bg2 = Sprite2D
var g1 = Sprite2D
var g2 = Sprite2D

var sivri_blok_sayi = 0
var blok_sayi = 0
var cukur_blok_sayi = 0
var yukarı = false

func _ready() -> void:
	Ortak.secim = bool(randi_range(0, 1))
	
	$Player.get_node("karakterler").frame = Ortak.frame
	$Player.get_node("ColorRect").color = Ortak.color
	$Player.get_node("CPUParticles2D").color = Ortak.color
	$".".get_node("sivri_blok17").visible=false
	$".".get_node("sivri_blok18").visible=false
	$".".get_node("sivri_blok19").visible=false

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

func _physics_process(delta: float) -> void:
	
	
	if Ortak.is_player_death:		
		Ortak.is_player_death = false

		get_tree().paused = true
		await get_tree().create_timer(1).timeout
		get_tree().paused = false
		get_tree().reload_current_scene()


	$Node2D.rotation +=.05
	$Node2D.position.x -= 0.5
	_sabit_hızda_hareket(g1, hiz*3)
	_sabit_hızda_hareket(g2, hiz*3)
	_sabit_hızda_hareket(bg1, hiz)
	_sabit_hızda_hareket(bg2, hiz)
	_sabit_hızda_hareket($Image, hiz)
	if $Image.position.x < 600:
		_sabit_hızda_hareket($Image, -hiz)
	
	
	
 

	
	var parent = $"."
	var gidisat = -1
	for child in parent.get_children():
		
		var kosul = child.name.begins_with("sivri_blok") or child.name.begins_with("cukur_blok") or child.name.begins_with("blok")
		if kosul and child != null:
				
			if child.name in ["sivri_blok17","sivri_blok18","sivri_blok19"] and child.position.x < 420:
				child.visible=true
			
			if child.name in ["sivri_blok50"] and child.position.x < 420:
				child.visible=false
				
			
			if child.name in ["sivri_blok20","sivri_blok21","sivri_blok22","sivri_blok23","sivri_blok24","sivri_blok25"] and child.position.x < 1000:
				_sabit_hızda_hareket3(child,hiz*1.1)

			if (child.name == "sivri_blok13" or child.name == "sivri_blok14" or child.name == "sivri_blok15") and child.position.x < 400:
				_sabit_hızda_hareket2(child,hiz-1)
			else:
				_sabit_hızda_hareket2(child,hiz*1.5)
				
			
			if child.name == "sivri_blok50" and child.position.x > 400 and child.position.x < 800:
				remove_child(child)
				if Input.is_action_just_pressed("jump") or Input.is_action_just_pressed("tik"):
					for i in range(400):
						$Player.position.y -= 10
						await get_tree().create_timer(.02).timeout

			if child.name.begins_with("blok") and int(child.name.trim_prefix("blok")) in range(40, 51) and child.position.x <200:
				
				_sabit_hızda_hareket2(child,(hiz+1.6)*-1)
			
			if child.name == "blok67" and child.position.x < 50:
				_sabit_hızda_hareket2(child,-hiz*1.5)

				if Ortak.ust:
					_sabit_hızda_hareket3(child, hiz*1.1)
				elif Ortak.alt:
					_sabit_hızda_hareket3(child,-1*hiz*1.1)
				else:
					_sabit_hızda_hareket3(child, hiz*1.1)

			if $Image.position.x < 1000 and child.name == "blok67":
				remove_child(child)
				

	
func _sabit_hızda_hareket(karakter:Sprite2D, hiz:float):
	karakter.position.x -= hiz
	if karakter.position.x < -600:
		karakter.position.x = 1790
	
func _sabit_hızda_hareket2(karakter:CharacterBody2D, hiz:float):
	if karakter !=null:
		karakter.position.x -= hiz
		if karakter.position.x < -600:
			remove_child(karakter)
		
		
func _sabit_hızda_hareket3(karakter:CharacterBody2D, hiz:float):
	if karakter !=null:
		karakter.position.y += hiz
		if karakter.position.x < -600:
			remove_child(karakter)
	


func _on_üst_area_entered(area: Area2D) -> void:
	
	Ortak.ust = true
	Ortak.alt = false
	
func _on_alt_area_entered(area: Area2D) -> void:
	
	Ortak.ust = false
	Ortak.alt = true
		

func _on_button_2_pressed() -> void:
	if Ortak.secim == true:
		get_tree().change_scene_to_file("res://Sahneler/bölüm_2.tscn")
	else:
		Ortak.is_player_death=true
	
		

func _on_button_pressed() -> void:
	if Ortak.secim == false:
		get_tree().change_scene_to_file("res://Sahneler/bölüm_2.tscn")
	else:
		Ortak.is_player_death=true
