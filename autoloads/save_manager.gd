extends Node

var buildings = {}

func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = 30
	timer.autostart = true
	add_child(timer)
	timer.timeout.connect(save)
	EventBus.building_level_changed.connect(_on_building_level_changed)

func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_PAUSED:
		save()

func save() -> void:
	var save_data = {}
	save_data["item"] = Inventory.item
	save_data["buildings"] = buildings
	var json_string = JSON.stringify(save_data)
	var file = FileAccess.open("user://save.json", FileAccess.WRITE)
	file.store_string(json_string)
	file.close()

func load() -> void:
	if FileAccess.file_exists("user://save.json"):
		var file = FileAccess.open("user://save.json", FileAccess.READ)
		var content = file.get_as_text()
		var save_data = JSON.parse_string(content)
		file.close()
		
		if save_data and save_data.has("item"):
			Inventory.item = save_data["item"]
		if save_data.has("buildings"):
			buildings = save_data["buildings"]
		
		for building_name in buildings:
			EventBus.building_level_changed.emit(building_name, buildings[building_name])

func _on_building_level_changed(building_name: String, level: int) -> void:
		buildings[building_name] = level
