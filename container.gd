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

func _input(event):
	if Input.is_key_pressed(KEY_Q):
		print("debug quit")
		Input.set_custom_mouse_cursor(null)
		game_clear()

func level_up_anim() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($HUD/LevelUpLabel, "theme_override_colors/font_color", Color.WHITE, 1.0)
	tween.chain().tween_property($HUD/LevelUpLabel, "theme_override_colors/font_color", Color(255,255,255,0), 1.0).set_delay(1.0)

func level_up() -> void:
	level += 1
	level_up_anim()
	$HUD.update_level(level)

func game_clear() -> void:
	print("cleared game, returning to menu...")
	get_tree().change_scene_to_file("res://menu.tscn")

func create_blob(type: String, pos: Vector2, force: Vector2 = Vector2(0,0)) -> void:
	# not merge
	if type == "":
		type = Utilities.generate_blob(level)
	elif Utilities.cat_map[type]["level"] > level:
		level_up()
	
	var blob_inst: Blob = blob.instantiate()
	blob_inst.NewBlob(type, pos)
	blob_inst.add_constant_central_force(force)
	self.call_deferred("add_child", blob_inst)
