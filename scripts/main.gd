extends Node2D


func _on_button_quit_pressed() -> void:
	get_tree().quit()


func _on_button_new_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")


func _on_button_load_pressed() -> void:
	Game.loadGame()
