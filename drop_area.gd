extends Area2D

var blob = load("res://blob.tscn")
var blob_list = ["basic", "special"]
var blob_type = ""

var basic_blob = preload("res://dodge_the_creeps_2d_assets/art/basic_blob.png")
var special_blob = preload("res://dodge_the_creeps_2d_assets/art/special_blob.png")

var blob_ready = false
var rng = RandomNumberGenerator.new()

var parent: MainContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent() as MainContainer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not blob_ready:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		rng.randomize()
		blob_type = blob_list[rng.randi() % blob_list.size()]
		
		if blob_type == "basic":
			Input.set_custom_mouse_cursor(basic_blob)
		elif blob_type == "special":
			Input.set_custom_mouse_cursor(special_blob)
		blob_ready = true


func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_released("TAP") and blob_ready:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		var click_pos: Vector2 = get_local_mouse_position()
		print("TAP detected at %s" % click_pos)
		parent.create_blob(blob_type, click_pos)
		blob_ready = false
#		await get_tree().create_timer(2.0).timeout