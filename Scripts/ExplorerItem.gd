extends Node

@export var item_name : String

@onready var label_node := $'Item Name' as Label

# Called when the node enters the scene tree for the first time.
func _ready():
	label_node.text = item_name
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
