extends CharacterBody2D

@export var karakterHiz = 7
var kontrol = true
var kontrol2 = true
#Birinci Yöntem
func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("gizli"):
		$".".visible=false
	else:
		$".".visible=true

	
	if Input.is_action_just_pressed("jump") or Input.is_action_just_pressed("tik") and kontrol2:
		
		if kontrol:
			kontrol = false
			for i in range(11):
				velocity.y = velocity.y - 2
				$".".rotation += 1

				move_and_collide(velocity * karakterHiz)
				await get_tree().create_timer(.04).timeout
			
			kontrol = true
			
		$".".rotation = 0
		
	if position.y < 430 and kontrol:
		kontrol2 = false
		
		velocity.y += 1.5

		var check = move_and_collide(velocity * karakterHiz)
		
		if check or position.y > 420:
			kontrol2 = true

		
		
	
	#move_and_collide(velocity * karakterHiz)


# İkinci Yöntem
#func _physics_process(delta: float) -> void: 
	#if Input.is_action_just_pressed("jump"):
		#
		#for i in range(10):
			#position.y -= 10
			#await get_tree().create_timer(.05).timeout
		#
		#for i in range(10):
			#position.y += 10
			#await get_tree().create_timer(.05).timeout
