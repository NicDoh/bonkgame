extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$UpdateTimer.wait_time = 1
	$UpdateTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_update_timer_timeout() -> void:
	var text = ""
	for i in Inventory.item:
		text += i + ": " + str(Inventory.item[i]) + "\n"
	$DebugLabel.text = text
