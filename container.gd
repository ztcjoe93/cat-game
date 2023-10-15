class_name MainContainer extends Node2D

var blob = load("res://blob.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Utilities.preload_catmap()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func create_blob(type: String, pos: Vector2) -> void:
	var blob_i: Blob = blob.instantiate()
	blob_i.NewBlob(type, pos)
	self.call_deferred("add_child", blob_i)
