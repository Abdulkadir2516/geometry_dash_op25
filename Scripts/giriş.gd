extends Control


func _ready() -> void:
	$Label.visible = true
	$ProgressBar.visible =true
	$grup.visible = false
	$grup/Player.get_node("CPUParticles2D").emitting = false
	
	$ProgressBar.value = 0
	for i in range(21):
		$ProgressBar.value += 5
		await get_tree().create_timer(.1).timeout
	
	$Label.visible = false
	$ProgressBar.visible =false
	$grup.visible = true

	


func _on_next_pressed() -> void:
	$grup/Player.get_node("karakterler").frame += 1


func _on_back_pressed() -> void:
	$grup/Player.get_node("karakterler").frame -= 1
