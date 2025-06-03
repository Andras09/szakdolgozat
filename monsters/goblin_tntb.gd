extends CharacterBody2D

var Dynamite=preload("res://monsters/dynamite.tscn")
var targets=["WarriorB", "ArcherB","WarriorP", "ArcherP","WarriorR", "ArcherR","WarriorY", "ArcherY"]
var currTargets=[]
var pathName=""
var curr

var reload = 0
var range = 400
@onready var timer = get_node("Timer")
@onready var aim: Node2D = $Aim

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("AnimatedSprite2D").play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_instance_valid(curr):
		if get_node("Timer").is_stopped():
			get_node("Timer").start()
	else:
		for child in get_node("DynamiteContainer").get_children():
			pass
			#child.queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	for target_name in targets:
		if target_name in body.name:
			get_node("AnimatedSprite2D").play("attack")
			# Gather all overlapping bodies from the Goblins Hitbox
			var curr_bodies = get_node("Area2D").get_overlapping_bodies()
			# Filter for soldier bodies
			var valid_targets= []
			for b in curr_bodies:
				if "WarriorB" in b.name:
					valid_targets.append(b)

			if valid_targets.size()==0:
				print("ITT A LUDAS")
				return

			# Select the soldier with the farthest progress
			curr = valid_targets[0].get_parent()
			for b in valid_targets:
				var parent = b.get_parent()
				if parent.get_progress() > curr.get_progress():
					curr = parent

			pathName = curr.get_parent().name

			# Begin shooting
			if get_node("Timer").is_stopped():
				get_node("Timer").start()
			return

	# If no target matched, revert to idle
	get_node("AnimatedSprite2D").play("idle")
	curr = null


func _on_area_2d_body_exited(body: Node2D) -> void:
	get_node("AnimatedSprite2D").play("idle")
	curr = null


func Throw() -> void:
	if pathName == "":
		return
	# Instantiate and add to container
	var temp_dy = Dynamite.instantiate()
	temp_dy.pathName = pathName
	get_node("DynamiteContainer").add_child(temp_dy)
	# Position and configure
	temp_dy.global_position = $Aim.global_position
	

func _on_timer_timeout() -> void:
	Throw()
