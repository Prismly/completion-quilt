class_name Patch

extends Node

@export_category("Patch Data")
@export var patchName: String
@export var patchDesc: String
@export var patchSprite: Texture2D
@export var gridLocation: Vector2i

@export_category("Node Refs")
@export var spriteNode: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if not spriteNode:
		print("Warning! Field 'spriteNode' of Patch " + patchName + " is not assigned!")
	
	spriteNode.texture = patchSprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	var mbEvent := event as InputEventMouseButton
	if not mbEvent or not mbEvent.is_pressed():
		return
	
	# This patch has been clicked. Ask the grid to select it.
	print("Selected Patch " + patchName)
