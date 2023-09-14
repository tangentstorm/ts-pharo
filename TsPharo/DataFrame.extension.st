Extension { #name : #DataFrame }

{ #category : #'*TsPharo' }
DataFrame >> gtDataFor: aView [
  <gtView>
  |view|
  view := aView columnedList
    title: 'Data';
    priority: 0;
    items: [self rows].
  self columnNames do: [:col|
    view column: col
      text: [:row | row at: col  ]].
  ^ view
]
