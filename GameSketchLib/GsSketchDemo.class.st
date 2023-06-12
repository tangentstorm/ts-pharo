Class {
	#name : #GsSketchDemo,
	#superclass : #GsApp,
	#instVars : [
		'selectangle'
	],
	#category : #'GameSketchLib-Demos'
}

{ #category : #accessing }
GsSketchDemo >> makeStartScene [
  |dragging|
  scene := GsSketch new.
  1 to: 3 do: [:j |
    1 to: 3 do: [:i |
      scene addChild: (GsCell new asElement
        addEventHandler: BlPullHandler new;
        relocate: (i*50)@(j*50))]].
  selectangle := BlElement new
    border: (BlBorder paint: Color cyan);
    visibility: BlVisibilityHidden new.
  scene addChild: selectangle.
  dragging := false.
  scene when: BlMouseDownEvent do: [:e|
    dragging := true.
    selectangle
      relocate: e localPosition;
      size: 0@0;
      visibility: BlVisibilityVisible new].
  scene when: BlMouseMoveEvent do: [:e|
    dragging ifTrue:[
      selectangle size:
        (e localPosition - selectangle position)]].
   scene when: BlMouseUpEvent do: [:e|
     dragging := false.
     selectangle visibility: BlVisibilityHidden new].
^ scene
]
