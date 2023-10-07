extends Node2D

var blob = load("res://blob.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("TAP"):
		var clickPos = get_local_mouse_position()
		print("TAP detected at %s" % clickPos)
		var blobI = blob.instantiate()
		blobI.position = clickPos
		add_child(blobI)
