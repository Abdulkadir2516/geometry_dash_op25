extends CharacterBody2D

@export var karakterHiz = 7

#Birinci Yöntem
func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_just_pressed("jump"):
		
		for i in range(10):
			velocity.y = velocity.y - 1
			move_and_collide(velocity * karakterHiz)
			await get_tree().create_timer(.05).timeout
		
		for i in range(10):
			velocity.y += 1
			move_and_collide(velocity * karakterHiz)
			await get_tree().create_timer(.05).timeout
		
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
