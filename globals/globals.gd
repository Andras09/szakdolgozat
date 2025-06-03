extends Node


var gold=1000
var soul=1000
var health=10
var b_deathcount=0
var r_deathcount=0
var p_deathcount=0
var y_deathcount=0
const SAVE_PATH = "res://save/savegame.bin"


func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"Health": Game.health,
		"Gold": Game.gold,
		"Soul": Game.soul
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Game.health = current_line["Health"]
				Game.Gold = current_line["Gold"]
				Game.soul = current_line["Soul"]
