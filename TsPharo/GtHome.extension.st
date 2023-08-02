Extension { #name : #GtHome }

{ #category : #'*TsPharo-Gt' }
GtHome >> tsPharoSection [
	<gtHomeSection>
	^ GtHomeStartPageSection new
		title: 'TsPharo';
		description: 'Tangentstorm''s Extensions';
		databaseName: 'TsPharo';
		startPageName: 'Tangentstorm''s Pharo Notebook';
		priority: 0
]
