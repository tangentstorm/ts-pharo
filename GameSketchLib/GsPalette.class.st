Class {
	#name : #GsPalette,
	#superclass : #Object,
	#instVars : [
		'colors',
		'name',
		'link'
	],
	#category : #'GameSketchLib-Colors'
}

{ #category : #accessing }
GsPalette class >> arne [
  <gtExample>
  ^ self new
    name: 'arne';
    link:'https://androidarts.com/palette/16pal.htm';
    intColors: {
      16rff000000. 16rff9d9d9d. 16rffffffff. 16rffbe2633.
      16rffe06f8b. 16rff493c2b. 16rffa46422. 16rffeb8931.
      16rfff7e26b. 16rff2f484e. 16rff44891a. 16rffa3ce27.
      16rff1b2632. 16rff005784. 16rff31a2f2. 16rffb2dcef}
]

{ #category : #accessing }
GsPalette class >> dawnbringer [
  <gtExample>
  ^ self new
    name: 'dawnbringer';
    link:'https://pixeljoint.com/forum/forum_posts.asp?TID=12795';
    intColors: {
      16rff140c1c. 16rff442434. 16rff30346d. 16rff4e4a4e.
      16rff854c30. 16rff346524. 16rffd04648. 16rff757161.
      16rff597dce. 16rffd27d2c. 16rff8595a1. 16rff6daa2c.
      16rffd2aa99. 16rff6dc2ca. 16rffdad45e. 16rffdeeed6}
]

{ #category : #accessing }
GsPalette class >> pico [
  <gtExample>
  ^ self new
    name: 'pico';
    link:'http://www.lexaloffle.com/pico-8.php';
    intColors:{
      16rff000000. 16rff1d2b53. 16rff7e2553. 16rff008751.
      16rffab5236. 16rff5f574f. 16rffc2c3c7. 16rfffff1e8.
      16rffff004d. 16rffffa300. 16rffffec27. 16rff00e436.
      16rff29adff. 16rff83769c. 16rffff77ab. 16rffffccaa}
]

{ #category : #'gt-extensions' }
GsPalette >> asElement [
	^ BrVerticalPane new fitContent
	    addChildren: {
	      BlTextElement new
	        text: self name asRopedText;
    		padding: (BlInsets top: 10).
   	   self gridWithSize:20. }
]

{ #category : #accessing }
GsPalette >> colors [
	^ colors
]

{ #category : #accessing }
GsPalette >> colors: anObject [
	colors := anObject
]

{ #category : #'gt-extensions' }
GsPalette >> gridWithSize: anInteger [ 
  ^ BrHorizontalGrid new
	  columnCount: 8;
	  cellSpacing: 1;
	  addChildren: (colors collect: [ :c | 
        BlElement new size: anInteger asPoint; background: c ]);
      fitContent
]

{ #category : #'gt-extensions' }
GsPalette >> gtPaletteFor: aView [
	<gtView>
	^ aView explicit
		title: 'Colors';
		stencil: [ self asElement ]
]

{ #category : #accessing }
GsPalette >> intColors: aCollection [
  colors := aCollection collect: [:x| x asColorOfDepth: 32].
]

{ #category : #accessing }
GsPalette >> link [
	^ link
]

{ #category : #accessing }
GsPalette >> link: anObject [
	link := anObject
]

{ #category : #accessing }
GsPalette >> name [
	^ name
]

{ #category : #accessing }
GsPalette >> name: anObject [
	name := anObject
]
