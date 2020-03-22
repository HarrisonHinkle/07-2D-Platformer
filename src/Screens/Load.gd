extends Button



func _on_Load_button_up():
	get_tree().change_scene("res://src/Levels/Level01.tscn")
	PlayerData.load_data2()
