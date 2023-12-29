#### As a User, I can...
- Pan the camera by holding and dragging LMB
- Zoom the camera in and out with the scroll wheel (centered on the mouse's position)
- Hover over a patch to highlight the entire patch
- Click on a patch to "select" it...
	- ...and the camera smoothly pans to center the selected patch in the view window
	- ...and see the patch's information displayed in a popup bubble

### [UC1] Launch Pixel Patchworks
[Prerequisites] User has literally just launched PixelPatchworks.exe
- On program startup...
	- Logo splash animation (stretch goal)
	- Load preview data for saved patchworks
	- Display preview data for loaded patchworks in a grid
		- Mimics a file explorer: names, thumbnails (compressed/zoomed to fit?)
	- Display "Create Patchwork" button after the last preview in the grid
		- Should look like a file outline with a '+' icon
- See [UC2], [UC3], [UC4] for User Actions
### [UC2] Create Patchwork
[Prerequisites] User is in the "My Patchworks" window
- On clicking the "Add Patchwork" button...
	- Create an empty patchwork save file
		- Name it something default like "New Patchwork (n)"
		- Where (n) is included if duplicate names exist in the directory
	- Open the "Edit Patchwork" window
### [UC3] Delete Patchwork
[Prerequisites] User is in the "My Patchworks" window
- On single-clicking a patchwork preview...
	- Display a trash can button in the corner of the preview
	- On clicking the trash can...
		- A confirmation window appears asking the user to confirm the deletion
		- The patchwork save file is deleted
### [UC4] Edit Patchwork
[Prerequisites] User is in the Patchwork editing window
- On double-clicking 
### [UC] Navigate Patchwork Window
[Prerequisites] User is in the Patchwork editing window


### [UC] Select Patch
[Prerequisites] User is in the Patchwork editing window
- On clicking 
### [UC] Import Patch
[Prerequisites] User is in the Patchwork editing window
- ...by selecting a file from my hard drive through in-game UI...
	- ...and seeing a popup error/warning if the image is too big to be convenient
### [UC] Delete Patch
#### Serialization
- Save Patchwork as Image
- Save Patchwork as JSON/Binary
- Load Patchwork from JSON/Binary
