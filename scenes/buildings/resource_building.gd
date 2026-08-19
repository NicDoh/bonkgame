extends Node
class_name ResourceBuilding

var level = 1
var tick_rate = 1
var amount = 1
var drop_source: Resource # typed as Resource instead of DropSource due to GDScript class resolution order

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func start_producing() -> void:
	$TickTimer.wait_time = tick_rate
	$TickTimer.start()

func stop_producing() -> void:
	$TickTimer.stop()

func _on_tick_timer_timeout() -> void:
	for entry in drop_source.tables:
		if randf() > entry.roll_chance:
			continue
		var roll = randf()
		for drop in entry.table.drops:
			roll -= drop.chance
			if roll <= 0:
				EventBus.item_produced.emit(drop.item.item_name, amount)
				return
