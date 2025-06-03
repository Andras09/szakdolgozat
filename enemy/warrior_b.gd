extends CharacterBody2D

@export var level1_scene: PackedScene = load("res://scenes/Level1.tscn")

var HEALTH=100
var chase=false
var SPEED=20
var goal
var sound_effects = {
	"walk": preload("res://assets/RPG_Essentials_Free/12_Player_Movement_SFX/08_Step_rock_02.wav"),
	"death": preload("res://assets/RPG_Essentials_Free/10_Battle_SFX/69_Enemy_death_01.wav"),
	"attack": preload("res://assets/RPG_Essentials_Free/12_Player_Movement_SFX/56_Attack_03.wav")
}

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
	Game.soul+=20
	Game.gold+=5
	Game.b_deathcount+=1
	get_node("AnimatedSprite2D").play("death")
	await get_node("AnimatedSprite2D").animation_finished
	get_parent().get_parent().queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	chase=true


func _on_animated_sprite_2d_frame_changed() -> void:
	if get_node("AnimatedSprite2D").is_playing():
		if get_node("AnimatedSprite2D").animation=="walk":
			pass
