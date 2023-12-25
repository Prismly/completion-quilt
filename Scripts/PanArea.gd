extends Node

var hovering : bool = false
var dragging : bool = false
@export var mainCamera : Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging and not Input.is_mouse_button_pressed(1):
		dragging = false # LMB was released during a drag; stop dragging.

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and hovering:
			dragging = true # LMB pressed on draggable area; start dragging.
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP and event.is_released():
			# Zoom in
			mainCamera.zoom_cam(1)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.is_released():
			# Zoom out
			mainCamera.zoom_cam(-1)
	elif event is InputEventMouseMotion and dragging: 
		mainCamera.pan_cam(-event.relative) # Mouse movement; move the camera accordingly.
		#self.position = Vector2(mainCamera.position.x - (mainCamera.screenSize().x / 2), mainCamera.position.y - (mainCamera.screenSize().y / 2))

func _on_mouse_entered():
	hovering = true

func _on_mouse_exited():
	hovering = false
