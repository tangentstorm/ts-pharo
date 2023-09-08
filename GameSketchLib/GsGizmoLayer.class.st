"
I am a layer for ""gizmos"" - visual objects like {{gtClass:GsHandle}} that need to be repositioned on the screen when the child transformation changes, but which should not scale along with the scene.

In other words, if you zoom the camera in to the center of a rectangle with handles in the corners, the rectangle will appear to get bigger and the handles will move further apart, but the handles themselves should not appear bigger.

"
Class {
	#name : #GsGizmoLayer,
	#superclass : #GsLayer,
	#category : #'GameSketchLib-Tools'
}
