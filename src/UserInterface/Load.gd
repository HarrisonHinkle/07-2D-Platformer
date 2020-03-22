extends Button

func _on_Load_button_up():
	get_tree().paused = false
	PlayerData.load_data()
