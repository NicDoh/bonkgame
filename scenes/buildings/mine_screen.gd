extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/Label.text = "Mine - Level " + str(SaveManager.buildings.get("mine", 1))
	EventBus.building_level_changed.connect(_on_building_level_changed)
	update_upgrade_button()

func _on_exit_button_pressed() -> void:
	queue_free()

func _on_upgrade_button_pressed() -> void:
	EventBus.upgrade_requested.emit()

func _on_building_level_changed(building_name: String, new_level: int) -> void:
	$CanvasLayer/Label.text = "Mine - Level " + str(new_level)
	update_upgrade_button()

func update_upgrade_button() -> void:
	var level = SaveManager.buildings.get("mine", 1)
	var data = JSON.parse_string(FileAccess.get_file_as_string("res://data/mine_data.json"))
	var level_data = data[str(level)]
	if not level_data.has("upgrade_cost"):
		$CanvasLayer/UpgradeButton.text = "Max Level"
		return
	var cost = level_data["upgrade_cost"]
	var cost_text = ""
	for item in cost:
		cost_text += str(cost[item]) + " " + item + "\n"
	$CanvasLayer/UpgradeButton.text = "Upgrade\n" + cost_text.strip_edges()
