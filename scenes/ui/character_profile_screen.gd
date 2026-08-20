extends CanvasLayer

func _ready() -> void:
	populate_inventory()

func _on_exit_button_pressed() -> void:
	queue_free()

func populate_inventory() -> void:
	var grid = $HBoxContainer/TabContainer/Inventory/ScrollContainer/GridContainer
	for item in Inventory.item:
		var panel = Panel.new()
		var label = Label.new()
		label.text = item + "\n" + str(int(Inventory.item[item]))
		panel.add_child(label)
		grid.add_child(panel)
		panel.custom_minimum_size = Vector2(80, 80)
