extends Node2D

@onready var path=preload("res://scenes/path.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if get_child_count() < 10:
		var tempath=path.instantiate()
		add_child(tempath)
