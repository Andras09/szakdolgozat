extends CharacterBody2D

@export var level1_scene: PackedScene = load("res://scenes/Level1.tscn")

var HEALTH=100
var chase=false
var SPEED=20
var goal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("AnimatedSprite2D").play("move")


func _physics_process(delta):
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_parent().set_progress(get_parent().get_progress() + SPEED*delta)
	
	if get_parent().get_progress_ratio() == 1 or HEALTH<=0:
		death()
	
	
func death():
	SPEED=0
	get_node("AnimatedSprite2D").play("death")
	await get_node("AnimatedSprite2D").animation_finished
	get_parent().get_parent().queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	chase=true
