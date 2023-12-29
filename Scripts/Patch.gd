class_name Patch

extends Node2D

@export_category("Patch Data")
@export var patch_data: PatchData

@onready var sprite_node := $Appearance as Sprite2D

var mouse_hovered : bool = false
var mouse_pressed : bool = false
var mouse_click_origin : Vector2 = Vector2.ZERO
var mouse_dragging : bool = false

var mouse_drag_deadzone : float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	print(patch_data.patch_name)
	sprite_node.set_material(sprite_node.get_material().duplicate())
	sprite_node.texture = load("res://Sprites/Patches/" + patch_data.sprite_path)
	sprite_node.z_index = patch_data.grid_layer * 2
	position = patch_data.grid_location
	mouse_drag_deadzone = pow(mouse_drag_deadzone, 2)
	
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
	if mouse_pressed and not mouse_dragging:
		var mouse_delta = get_viewport().get_mouse_position().distance_squared_to(mouse_click_origin)
		if mouse_delta > mouse_drag_deadzone:
			print("DRAG FLAG")
			mouse_dragging = true
	
	if mouse_dragging:
		print("DRAGGING")
	pass

func _input(event):
	var mb_event := event as InputEventMouseButton
	if not mb_event or not mouse_hovered:
		return
	
	if mb_event.button_index == MOUSE_BUTTON_LEFT:
		if mb_event.is_pressed():
			print("mouse pressed on patch " + patch_data.patch_name)
			mouse_pressed = true
			mouse_click_origin = get_viewport().get_mouse_position()
		elif mb_event.is_released():
			print("mouse released on patch " + patch_data.patch_name)
			mouse_pressed = false
			mouse_dragging = false
			mouse_click_origin = Vector2.ZERO
	
	# This patch has been clicked. Ask the grid to select it.
	pass

func _on_mouse_entered():
	sprite_node.material.set_shader_parameter("is_visible", true)
	sprite_node.z_index = patch_data.grid_layer * 2 + 1
	mouse_hovered = true
	pass

func _on_mouse_exited():
	sprite_node.material.set_shader_parameter("is_visible", false)
	sprite_node.z_index = patch_data.grid_layer * 2
	mouse_hovered = false
	pass
