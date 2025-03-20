extends TileMapLayer

@export var warriorB_scene: PackedScene = preload("res://enemy/WarriorB.tscn")

var enemy_num=10
var cell_size=Vector2(16, 16)
var random = RandomNumberGenerator.new()

func spawn_enemy()->void:
	var used_cells = get_used_cells()
	if used_cells==null:
		print("No spawner cells found.")
		return

	# Use the last cell as the spawn point.
	var spawn_cell = used_cells[used_cells.size() - 1]
	var world_position = global_position + (Vector2(spawn_cell) * cell_size)

	for i in range(enemy_num):
		var enemy = warriorB_scene.instantiate()
		enemy.z_index=2
		enemy.global_position = world_position
		get_parent().add_child(enemy)
		
		await get_tree().create_timer(3.0).timeout
		


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_enemy()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
