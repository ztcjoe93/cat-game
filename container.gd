class_name MainContainer extends Node2D

var blob = load("res://blob.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_blob_at_coords(pos: Vector2) -> void:
	pass

func create_blob(type: String, pos: Vector2) -> void:
	var blob_i: Blob = blob.instantiate()
	blob_i.NewBlob(type, pos)
	print(blob_i)
	self.add_child(blob_i)
