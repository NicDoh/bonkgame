extends ResourceBuilding

func _ready() -> void:
	load_drop_table()
	EventBus.building_level_changed.connect(_on_building_level_changed)
	EventBus.upgrade_requested.connect(upgrade)

func load_drop_table() -> void:
	var data = JSON.parse_string(FileAccess.get_file_as_string("res://data/mine_data.json"))
	var level_data = data[str(level)]["drops"]
	var table = DropTable.new()
	
	for item in level_data:
		var entry = DropEntry.new()
		entry.item = load("res://data/" + item + ".tres")
		entry.chance = level_data[item]
		table.drops.append(entry)
		
	var table_entry = DropTableEntry.new()
	table_entry.roll_chance = 1.0
	table_entry.table = table
	
	drop_source = DropSource.new()
	drop_source.tables.append(table_entry)

func upgrade() -> void:
	if can_afford_upgrade():
		var data = JSON.parse_string(FileAccess.get_file_as_string("res://data/mine_data.json"))
		var cost = data[str(level)]["upgrade_cost"]
		for item in cost:
			Inventory.item[item] -= cost[item]
			
		level = level + 1
		EventBus.building_level_changed.emit("mine", level)
		stop_producing()
		load_drop_table()
		start_producing()

func can_afford_upgrade() -> bool:
	var data = JSON.parse_string(FileAccess.get_file_as_string("res://data/mine_data.json"))
	var level_data = data[str(level)]
	if not level_data.has("upgrade_cost"):
		return false
	var cost = level_data["upgrade_cost"]
	for item in cost:
		if Inventory.item.get(item, 0) < cost[item]:
			return false
	return true

func _on_building_level_changed(building_name: String, new_level: int) -> void:
		if building_name == "mine":
			level = new_level
			load_drop_table()
