class_name Patch

extends Node2D

@export_category("Patch Data")
@export var patch_data: PatchData

static var unhighlighted_z_idx : int = 0
static var highlighted_z_idx : int = 5

@onready var sprite_node := $Appearance as Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print(patch_data.patch_name)
	sprite_node.set_material(sprite_node.get_material().duplicate())
	sprite_node.texture = load("res://Sprites/" + patch_data.sprite_path)
	self.position = patch_data.grid_location
	
	prepare_collision_polygon()

func prepare_collision_polygon():
	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha(sprite_node.texture.get_image())
	var polys = bitmap.opaque_to_polygons(Rect2(Vector2.ZERO, sprite_node.texture.get_size()), 0)
	for poly in polys:
		var collision_polygon = CollisionPolygon2D.new()
		collision_polygon.polygon = poly
		self.add_child(collision_polygon)
		if (sprite_node.centered):
			#print("---")
			#print(bitmap.get_size())
			#print(bitmap.get_size() / 2)
			#print(bitmap.get_size() / 2 as Vector2)
			
			collision_polygon.position -= bitmap.get_size() / 2 as Vector2
			if (bitmap.get_size().x % 2 == 1):
				collision_polygon.position += Vector2.LEFT
			if (bitmap.get_size().y % 2 == 1):
				collision_polygon.position += Vector2.UP
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_input_event(viewport, event, shape_idx):
	var mb_event := event as InputEventMouseButton
	if not mb_event or not mb_event.is_pressed():
		return
	
	# This patch has been clicked. Ask the grid to select it.

func _on_mouse_entered():
	sprite_node.material.set_shader_parameter("is_visible", true)
	sprite_node.z_index = highlighted_z_idx
	pass

func _on_mouse_exited():
	sprite_node.material.set_shader_parameter("is_visible", false)
	sprite_node.z_index = unhighlighted_z_idx
	pass
