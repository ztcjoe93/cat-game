class_name Blob extends RigidBody2D

signal merge_signal(pos: Vector2)

var basic_blob = preload("res://dodge_the_creeps_2d_assets/art/basic_blob.png")
var special_blob = preload("res://dodge_the_creeps_2d_assets/art/special_blob.png")
var rng = RandomNumberGenerator.new()
var parent: MainContainer

enum BlobType {BASIC, SPECIAL}

# expose variables to be modifiable from either editor/get_properties_list()
@export var merged: bool = false
@export var blob_type: BlobType

# constructor for blob
func NewBlob(type: String, pos: Vector2) -> void:
	self.position = pos
	if type == "basic":
		$Sprite2D.set_texture(basic_blob)
		self.blob_type = BlobType.BASIC
	elif type == "special":
		$Sprite2D.set_texture(special_blob)
		self.blob_type = BlobType.SPECIAL		


# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent() as MainContainer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body: RigidBody2D) -> void:
	if body is Blob and can_merge(self, body):
		merge_sequence(self, body)


func can_merge(blob1: Blob, blob2: Blob) -> bool:
	return (blob1.blob_type == blob2.blob_type and !blob1.merged and !blob2.merged)


# checks if blobs can be merged via type + pseudo merge mutex into new blob creation
func merge_sequence(blob1: Blob, blob2: Blob) -> void:
	blob1.merged = true
	blob2.merged = true
	var mp : Vector2 = calculate_midpoint(blob1.position, blob2.position)
	print("%s :: %s \n midpoint: %s" % [blob1.position, blob2.position, mp])
	
	blob1.queue_free()
	blob2.queue_free()
	
	parent.create_blob_at_coords(mp)


func calculate_midpoint(pos1: Vector2, pos2: Vector2) -> Vector2:
	return Vector2((pos1.x + pos2.x)/2, ((pos1.y + pos2.y)/2))

