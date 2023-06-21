Extension { #name : #Object }

{ #category : #'*Tangentstorm' }
Object class >> gtBrowserFor: aView [
  <gtView>
  <gtClassView>
  ^ aView explicit
    title: 'Browse';
    stencil: [ TsClassBrowser for: self]
]
