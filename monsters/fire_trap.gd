extends StaticBody2D

var damage=20
var targets=["WarriorB", "ArcherB","WarriorP", "ArcherP","WarriorR", "ArcherR","WarriorY", "ArcherY"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	for target in targets:
		if target in body.name:
			get_node("AnimatedSprite2D").play("attack")
			body.HEALTH-=damage


func _on_area_2d_body_exited(body: Node2D) -> void:
	get_node("AnimatedSprite2D").play("idle")
