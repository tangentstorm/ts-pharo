Extension { #name : #BlElement }

{ #category : #'*GameSketchLib' }
BlElement >> findChild: aPath [
  "aPath should be #(list of symbols)"
  ^ aPath inject: self into: [:accum :each| accum childNamed: each]
]

{ #category : #'*GameSketchLib' }
BlElement >> gsBottom [
  ^ self position y + self extent y
]

{ #category : #'*GameSketchLib' }
BlElement >> gsBottom: y [
  self gsMoveBy: 0 @ (y - self gsBottom)
]

{ #category : #'*GameSketchLib' }
BlElement >> gsBottomRight [
  "the bottom right corner of the bounding box"
  ^ self position + self extent
]

{ #category : #'*GameSketchLib' }
BlElement >> gsBottomRight: aPoint [
  ^ self size: (aPoint - self gsPosition) 
]

{ #category : #'*GameSketchLib' }
BlElement >> gsCenter [
  ^ self position + (self extent / 2)
]

{ #category : #'*GameSketchLib' }
BlElement >> gsCenter: aPoint [
  ^ self gsMoveBy: (aPoint - self gsCenter) 
]

{ #category : #'*GameSketchLib' }
BlElement >> gsContainsPoint: p [
  ^ (self bounds asRectangle containsPoint: p)
    and: [self geometry 
      containsPoint: p - self position in: self parent]
]

{ #category : #'*GameSketchLib' }
BlElement >> gsCopy [
  "probably not great but it works" 
  ^ GsJsonReader new read: self gsJson
]

{ #category : #'*GameSketchLib' }
BlElement >> gsDependencies [
  "return a list of ids on which this shape depends" 
  ^ #()
]

{ #category : #'*GameSketchLib' }
BlElement >> gsFill [
  "returns fill color as hex. !!TODO: add alpha if not opaque.
   (Color fromHexString: can already handle this)"
  |b|  b := self background.
  ^ b isTransparent
    ifTrue: [''] ifFalse: [b paint color asHTMLColor]
]

{ #category : #'*GameSketchLib' }
BlElement >> gsFill: aHexString [
  self background:
    ((aHexString = '' or:[aHexString isNil])
      ifTrue: [Color transparent]
      ifFalse:[Color fromHexString: aHexString])
]

{ #category : #'*GameSketchLib' }
BlElement >> gsFillDescription [
  <magritteDescription>
  ^ (GsDescriptionWrapper new for: MAStringDescription new)
      accessor: #gsFill;
      label: 'Fill color';
      priority: 10;
      jsonKey: 'fill'
]

{ #category : #'*GameSketchLib' }
BlElement >> gsHandles [
  "return a collection of handles. by default, show top left and bottom right corners of bounding box."
  |pbr|
  ^ { pbr := GsHandle new for: self prop: GsProp bottomRight.
      (GsHandle new for: self prop: GsProp position)
      when: BlPullEvent do: [ pbr refresh] }
]

{ #category : #'*GameSketchLib' }
BlElement >> gsHide [
  self visibility: BlVisibilityHidden new
]

{ #category : #'*GameSketchLib' }
BlElement >> gsId [
  ^ (self id isKindOf: BlElementNoId)
    ifTrue: ['']
    ifFalse: [self id asSymbol asString]
]

{ #category : #'*GameSketchLib' }
BlElement >> gsId: aString [
  self id: aString
]

{ #category : #'*GameSketchLib' }
BlElement >> gsIdDescription [
  <magritteDescription>
  ^ (GsDescriptionWrapper new for: MAStringDescription new)
      accessor: #gsId;
      label: 'Id';
      priority: 0;
      jsonKey: 'id'
]

{ #category : #'*GameSketchLib' }
BlElement >> gsInspectorButtons [
  |methods|
  methods := (self class gtMethodsInClass
    & #gsInspectorCmd gtPragmas) contents.
  ^ (methods collect: [:m|
      BrButton new
        aptitude: (BrGlamorousButtonWithLabelAptitude new);
        label: m selector;
        action: [self perform: m selector]]),
    { GsInspectorButton new
        icon: BrGlamorousVectorIcons inspect;
        label: 'Inspect shape';
        action: [:aButton | 
          aButton phlow spawnTool: self gtDefaultInspectorTool ] }

]

{ #category : #'*GameSketchLib' }
BlElement >> gsIsPositionable [
  ^ true
]

{ #category : #'*GameSketchLib' }
BlElement >> gsLeft [
  ^ self position x
]

{ #category : #'*GameSketchLib' }
BlElement >> gsLeft: x [
  self gsMoveBy: (x - self gsLeft)@0
]

{ #category : #'*GameSketchLib' }
BlElement >> gsMoveBy: aPoint [
  self gsPosition: (self gsPosition + aPoint)
]

{ #category : #'*GameSketchLib' }
BlElement >> gsPosition [
  ^ self position
]

{ #category : #'*GameSketchLib' }
BlElement >> gsPosition: aPoint [
    "this has to be a separate interface from 'position', because shapes know where they are regardless of layout. See GsLineShape for extreme example."
    self relocate: aPoint
]

{ #category : #'*GameSketchLib' }
BlElement >> gsRebuildStroke [
  |builder|
  builder := BlBorder builder
    paint: (userData at: #strokeColor ifAbsent: [self border paint color]).
  (self gsStrokeStyle = #dashed) ifTrue: [builder dashed].
  self border: builder build.
]

{ #category : #'*GameSketchLib' }
BlElement >> gsRight [
  ^ self position x + self extent x
]

{ #category : #'*GameSketchLib' }
BlElement >> gsRight: x [
  self gsMoveBy: (x - self gsRight)@0
]

{ #category : #'*GameSketchLib' }
BlElement >> gsShow [
  self visibility: BlVisibilityVisible new
]

{ #category : #'*GameSketchLib' }
BlElement >> gsStrokeColor [
  |c| c := userData at: #strokeColor ifAbsentPut: [self border paint color].
  "returns stroke color as hex. !!TODO: add alpha if not opaque.
   (Color fromHexString: can already handle this)"
  ^ (c = Color transparent)
    ifTrue: [''] ifFalse: [c asHTMLColor]
]

{ #category : #'*GameSketchLib' }
BlElement >> gsStrokeColor: aHexString [
  |b c |
  b := self border.
  c := ((aHexString = '' or:[aHexString isNil])
    ifTrue: [Color transparent]
    ifFalse:[Color fromHexString: aHexString]).
  userData at: #strokeColor put: c.
  self gsRebuildStroke
]

{ #category : #'*GameSketchLib' }
BlElement >> gsStrokeColorDescription [
  <magritteDescription>
  ^ (GsDescriptionWrapper new for: MAStringDescription new)
      accessor: #gsStrokeColor;
      label: 'Stroke color';
      priority: 10;
      jsonKey: 'strokeColor'
]

{ #category : #'*GameSketchLib' }
BlElement >> gsStrokeStyle [
  ^ userData at: #gsStrokeStyle ifAbsentPut: [#solid]
]

{ #category : #'*GameSketchLib' }
BlElement >> gsStrokeStyle: aSymbol [
  self userData at: #gsStrokeStyle put: aSymbol.
  self gsRebuildStroke
]

{ #category : #'*GameSketchLib' }
BlElement >> gsStrokeStyleDescription [
  <magritteDescription>
  ^ MASingleOptionDescription new
    label: 'stroke style';
    accessor: #gsStrokeStyle;
    options: #(solid dashed)
]

{ #category : #'*GameSketchLib' }
BlElement >> gsTop [
  ^ self position y
]

{ #category : #'*GameSketchLib' }
BlElement >> gsTop: y [
  self gsMoveBy: 0 @ (y - self gsTop)
]

{ #category : #'*GameSketchLib' }
BlElement >> gsUpdateDependencies: idMap [
  "update dependencies when their ids change (either due to rename or duplicate).
  idMap maps id symbol to new object"
  ^ self
]
