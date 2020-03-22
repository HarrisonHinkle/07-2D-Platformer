extends Node


signal updated
signal died
signal reset

var score: = 0 setget set_score
var deaths: = 0 setget set_deaths


var save_path = "res://savegame.sav"
var config = ConfigFile.new()
var load_data = config.load(save_path)

func _physics_process(delta):
	if Input.is_action_just_pressed("save"):
		save_data()
	if Input.is_action_just_pressed("load"):
		load_data()
func reset():
	self.score = 0
	self.deaths = 0
	emit_signal("reset")


func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("updated")


func set_deaths(new_value: int) -> void:
	deaths = new_value
	emit_signal("died")
	
func save_data():
	config.set_value("save","score",score)
	config.set_value("save", "deaths", deaths)
	config.save(save_path)


func load_data():
	score = config.get_value("save","score")
	deaths = config.get_value("save","deaths")
	get_tree().reload_current_scene()
	emit_signal("updated")

func load_data2():
	score = config.get_value("save","score")
	deaths = config.get_value("save","deaths")
	emit_signal("updated")
