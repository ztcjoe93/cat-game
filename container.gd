class_name MainContainer extends Node2D

var blob: Resource = load("res://blob.tscn")
# indicative of which types of blob spawn
var level: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	Utilities.preload_catmap()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func level_up() -> void:
	level += 1

func create_blob(type: String, pos: Vector2) -> void:
	# not merge
	if type == "":
		type = Utilities.generate_blob(level)
	
	var blob_inst: Blob = blob.instantiate()
	blob_inst.NewBlob(type, pos)
	self.call_deferred("add_child", blob_inst)
