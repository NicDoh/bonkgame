extends Node

var item = {}

func _ready() -> void:
	EventBus.item_produced.connect(_on_item_produced)

func _on_item_produced(item_name, amount) -> void:
	if not item.has(item_name):
		item[item_name] = 0
	item[item_name] += amount
	print(item_name, ": ", item[item_name])
