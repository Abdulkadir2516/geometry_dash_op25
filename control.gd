extends Control

@onready var progress_bar = $ProgressBar

func _ready():
	progress_bar.value = 0
	start_loading()

func start_loading():
	# Simülasyon: %100'e kadar her 0.1 saniyede bir artır
	var current = 0
	while current <= 100:
		progress_bar.value = current
		current += 1
		await get_tree().create_timer(0.1).timeout
