extends RigidBody2D

var basic_blob = preload("res://dodge_the_creeps_2d_assets/art/basic_blob.png")
var special_blob = preload("res://dodge_the_creeps_2d_assets/art/special_blob.png")

# constructor for blob
func init(blob_type : String):
	if blob_type == "special":
		$Sprite2D.set_texture(special_blob)
	elif blob_type == "basic":
		$Sprite2D.set_texture(basic_blob)
	
	self.set_meta("type", blob_type)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.get_class() == "RigidBody2D":
		print("collided with blob-type: %s" % body.get_meta("type"))
		if self.get_meta("type") == body.get_meta("type"):
			body.queue_free()
			self.queue_free()
