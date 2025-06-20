extends Control

@onready var main = $"../"

func _on_resume_pressed() -> void:
	main.pauseMenu()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_save_game_pressed() -> void:
	Game.saveGame()
