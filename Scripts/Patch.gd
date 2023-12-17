class_name Patch

extends Node

@export_category("Patch Data")
@export var patchName: String
@export var patchDesc: String
@export var patchSprite: Texture2D
@export var gridLocation: Vector2i

static var unhighlightedZIdx : int = 0
static var highlightedZIdx : int = 5

@export_category("Node Refs")
@export var highlightShader : Shader
@export var spriteNode: TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	var matDupe = spriteNode.get_material().duplicate()
	spriteNode.set_material(matDupe)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	var mbEvent := event as InputEventMouseButton
	if not mbEvent or not mbEvent.is_pressed():
		return
	
	# This patch has been clicked. Ask the grid to select it.
	print("Selected Patch " + patchName)
	


func _on_mouse_entered():
	spriteNode.material.set_shader_parameter("is_visible", true)
	spriteNode.z_index = highlightedZIdx
	pass


func _on_mouse_exited():
	spriteNode.material.set_shader_parameter("is_visible", false)
	spriteNode.z_index = unhighlightedZIdx
	pass
