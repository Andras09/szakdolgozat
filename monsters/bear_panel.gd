extends Panel
 
var beartrap=preload("res://monsters/bearTrap.tscn")
var firetrap=preload("res://monsters/fireTrap.tscn")
var currTile


func isBear():
	var isbear = get_meta("caller") == "bear"
	return isbear

func _on_gui_input(event: InputEvent) -> void:
	var temp
	if not isBear():
		temp=firetrap.instantiate()
	else:
		temp=beartrap.instantiate()
	#left hold
	if (Game.gold>=30 and isBear()) or (Game.gold>=40 and not isBear()):
		if event is InputEventMouseButton and event.button_mask == 1:
			temp.scale = Vector2(2,2)
			add_child(temp)
			temp.global_position = event.global_position
			
		#button left down and dragging
		elif event is InputEventMouseMotion and event.button_mask == 1:
			if get_child_count() > 1:
				get_child(1).global_position = event.global_position
				#Check if on Dirt Tile.
				var mapPath = get_tree().get_root().get_node("Level1/ground")
				var tile = mapPath.local_to_map(get_global_mouse_position())
				currTile = mapPath.get_cell_atlas_coords(tile)
				var targets = get_child(1).get_node("Area2D").get_overlapping_bodies()
				
		elif event is InputEventMouseButton and event.button_mask == 0:
			#button left release
			if event.global_position.x >= 1152:
				if get_child_count() > 1:
					get_child(1).queue_free()
			else:
				#check for valid tile:
				if get_child_count() > 1:
					get_child(1).queue_free()
				var targets = get_child(1).get_node("Area2D").get_overlapping_bodies()
				var path = get_tree().get_root().get_node("Level1/traps")
				
				if (targets.size() < 2):
					path.add_child(temp)
					temp.global_position = event.global_position
					temp.scale = Vector2(2,2)
					
					if isBear():
						Game.gold-=30
					else:
						Game.gold-=40
		else:
			if get_child_count() > 1:
				get_child(1).queue_free()
