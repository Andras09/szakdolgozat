extends CharacterBody2D

var damage=20
var SPEED=100
var pathName=""
var target
var had_target= false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var pathSpawnerNode = get_tree().get_root().get_node("Level1/PathSpawner")
	for i in pathSpawnerNode.get_child_count():
		if pathSpawnerNode.get_child(i).name == pathName:
			target = pathSpawnerNode.get_child(i).get_child(0).get_child(0).global_position

	velocity = global_position.direction_to(target) *SPEED
	look_at(target)
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if "WarriorB" in body.name or "ArcherB" in body.name:
		body.HEALTH-=damage
		print(body.HEALTH)
		queue_free()
