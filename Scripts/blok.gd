extends CharacterBody2D

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body.name == "Player":
		die()

func die():
	print("Öldün!")
	#queue_free()  # Karakteri sahneden kaldırır
   
