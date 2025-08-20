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

func _physics_process(delta: float) -> void:
	Ortak.frame = $grup/Player.get_node("karakterler").frame
	Ortak.color = $grup/Player.get_node("ColorRect").color
	
func _on_next_pressed() -> void:
	$grup/Player.get_node("karakterler").frame += 1

func _on_back_pressed() -> void:
	$grup/Player.get_node("karakterler").frame -= 1

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Sahneler/bölüm_1.tscn")

func _on_color_picker_button_color_changed(color: Color) -> void:
	$grup/Player.get_node("ColorRect").color = $grup/ColorPickerButton.color



func _on_h_slider_value_changed(value: float) -> void:
	Ortak.volume =  value # int($grup/HSlider.value)	
	print(Ortak.volume)
