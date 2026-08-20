extends CanvasLayer

func _on_button_pressed() -> void:
	var screen = preload("res://scenes/ui/character_profile_screen.tscn").instantiate()
	add_child(screen)
