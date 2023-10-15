extends Area2D

var blob = load("res://blob.tscn")
var blob_type = ""

var blob_ready: bool = false
var within_drop_zone: bool = false
var rng = RandomNumberGenerator.new()

var parent: MainContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent() as MainContainer
	blob_preparation()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not blob_ready:
		blob_preparation()


func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_released("TAP") and blob_ready:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		var click_pos: Vector2 = get_local_mouse_position()
		print("TAP detected at %s" % click_pos)
		parent.create_blob(blob_type, click_pos)
		blob_ready = false


func set_cursor(blob_type: String) -> void:
	if blob_type != "":
		Input.set_custom_mouse_cursor(Utilities.cat_map[blob_type]["asset"])
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func blob_preparation() -> void:
	rng.randomize()
	blob_type = Utilities.cat_list[rng.randi() % Utilities.cat_list.size()]
	set_cursor(blob_type)
	blob_ready = true


func _on_mouse_entered() -> void:
	set_cursor(blob_type)
	

func _on_mouse_exited() -> void:
	set_cursor("")
