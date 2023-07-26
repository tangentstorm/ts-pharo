Class {
	#name : #BaselineOfTsPharo,
	#superclass : #BaselineOf,
	#category : #BaselineOfTsPharo
}

{ #category : #accessing }
BaselineOfTsPharo >> baseline: spec [
  <baseline>
  ^ spec for: #common do: [
  	spec package: 'TsPharo' ]
]

{ #category : #accessing }
BaselineOfTsPharo >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'ts-pharo' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]
