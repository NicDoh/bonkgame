extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SaveManager.load()
	$Mine.start_producing()

func _on_mine_texture_button_pressed() -> void:
	var screen = preload("res://scenes/buildings/mine_screen.tscn").instantiate()
	add_child(screen)

#-----------debug-----------------
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_F5:
		SaveManager.reset()
		get_tree().reload_current_scene()
