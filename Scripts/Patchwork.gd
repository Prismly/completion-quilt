extends Node

var patch_collection = {}
@export var debug_save_path = "user://testFile.save"

@export var debug_texture : Texture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func save_patchwork():
	print("save patchwork")
	var save_file = FileAccess.open(debug_save_path, FileAccess.WRITE)
	save_file.store_var(debug_texture.get_image())
	#var test_dict = { "One" : 1, "Two" : 2, "Three": 3 }
	#save_file.store_var(test_dict)
	save_file.close()
	pass

func load_patchwork():
	print("load patchwork")
	var save_file = FileAccess.open(debug_save_path, FileAccess.READ)
	var print_var = save_file.get_var()
	save_file.close()
	pass

func export_patchwork():
	print("export patchwork")
	
	pass
