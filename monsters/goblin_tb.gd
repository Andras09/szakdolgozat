extends CharacterBody2D

var health=100
var chase=false
var SPEED=40

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite2D").play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D):
	chase=true
