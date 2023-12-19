extends Node2D

var zoomScale : int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	# Snap camera to the nearest pixel.
	#self.offset = Vector2(snapped(self.position.x, 1) - self.position.x,
			#snapped(self.position.y, 1) - self.position.y)

## Adjusts the zoom and position of this camera.
## zoomDelta - The amount by which to change the zoom parameter (+ zooms in).
## cursorDelta - Viewport coord vector from the center of the camera region to the cursor position.
func zoomCam(zoomDelta : float):
	var oldZoomScl : float = zoomScale
	# Change zoom scale, ensuring we don't hit 0 (which is undefined behavior).
	zoomScale = clamp(zoomScale + zoomDelta, 1, 4)
	self.zoom = Vector2(zoomScale, zoomScale)
	
	# Move the camera's center to halfway between current and the mouse position.
	if (oldZoomScl != zoomScale):
		#self.position += cursorDelta
		var mousePos : Vector2 = get_viewport().get_mouse_position()
		var viewportCenter : Vector2 = get_viewport_rect().size / 2
		
		var zoomDeltaSign
		var shiftZoomScl
		if (zoomDelta > 0):
			zoomDeltaSign = 1
			shiftZoomScl = oldZoomScl
		else:
			zoomDeltaSign = -1
			shiftZoomScl = zoomScale
		
		var posShift : Vector2 = (mousePos - viewportCenter) / (shiftZoomScl * (shiftZoomScl + 1)) * zoomDeltaSign
		self.position += posShift
		print(posShift)

func panCam(posDelta : Vector2):
	var oldPosition : Vector2 = self.position
	# Move camera object along the offset, scaling by current zoom.
	self.position += posDelta / zoomScale
