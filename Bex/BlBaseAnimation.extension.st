Extension { #name : #BlBaseAnimation }

{ #category : #'*Bex' }
BlBaseAnimation >> pause [
  isRunning := false.
]

{ #category : #'*Bex' }
BlBaseAnimation >> play [
  isRunning := true.
]
