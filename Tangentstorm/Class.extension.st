Extension { #name : #Class }

{ #category : #'*Tangentstorm' }
Class >> gtBrowserFor: aView [
  <gtView>
  <gtClassView>
  ^ aView explicit
    title: 'Browse';
    stencil: [ TsClassBrowser for: self]
]
