Class {
	#name : #TsOneNoteClient,
	#superclass : #Object,
	#instVars : [
		'token',
		'tenantId',
		'clientId'
	],
	#category : #'TsPharo-OneNote'
}

{ #category : #login }
TsOneNoteClient >> authorizationUrl [
  "!! for future reference. this is for the graph api (enterprise).
  not yet used here."
  ^ 'https://login.microsoftonline.com', tenantId,
    '/oauth2/authorize',    
    '?client_id=', clientId,
    '&state=12345',
    '&response_type=code',
    '&response_mode=query',
     '&scope=office.onenote',
    '&resource=https://onenote.com/',
    '&redirect_uri=', self redirectUri
]

{ #category : #login }
TsOneNoteClient >> codeFlowUrl [
  "code flow login. this is the setup currently used by this class."
  "https://learn.microsoft.com/en-us/previous-versions/office/office-365-api/how-to/onenote-auth#code-flow"
  ^ ('https://login.live.com/oauth20_authorize.srf',
     '?response_type=code',
     '&client_id=', clientId,
     '&scope=office.onenote',
     '&redirect_uri=', self redirectUri)
     asUrl

]

{ #category : #login }
TsOneNoteClient >> fromConfig: aPath [
	| d secret |
	d := STONJSON fromString: aPath asFileReference contents.
	tenantId := d at: #tenantId.
	clientId := d at: #clientId.
	secret := d at: #clientSecret.
	self listenForCodeOnPort: 8989.
	WebBrowser openOn: self codeFlowUrl
]

{ #category : #accessing }
TsOneNoteClient >> listNotebooks [
  ^ STONJSON fromString: (ZnClient new
    url: 'https://www.onenote.com/api/v1.0/me/notes/notebooks';
    headerAt: 'Authorization' put: 'Bearer ', (token at:#access_token);
    get)
]

{ #category : #accessing }
TsOneNoteClient >> listOneNotePagesFor: userId [
  ^ ZnClient new
    url: 'https://graph.microsoft.com/v1.0/users/', userId, '/onenote/pages';
    headerAt: 'Authorization' put: 'Bearer ', (token at:#access_token);
    get
]

{ #category : #login }
TsOneNoteClient >> listenForCodeOnPort: port [
  "https://learn.microsoft.com/en-us/previous-versions/office/office-365-api/how-to/onenote-auth#code-flow"
  ZnServer startDefaultOn: port.
  ZnServer default delegate
    map: 'callback'
    to: [ :request | |code|
      code := request uri queryAt: 'code' ifAbsent: [ '' ].
	  ZnResponse ok: (ZnEntity
	    text: (code = ''
	      ifTrue: [ 'Onenote login failed.' ]
	      ifFalse: [
	        self loginWithCode: code.
	        'Logged into OneNote. ' ,
	        'You can close this browser tab.' ]) )]
]

{ #category : #login }
TsOneNoteClient >> listenForCodeOnPort: port withSecret: secret [
  "https://learn.microsoft.com/en-us/previous-versions/office/office-365-api/how-to/onenote-auth#code-flow"
  ZnServer startDefaultOn: port.
  ZnServer default delegate
    map: 'callback'
    to: [ :request | |code|
      code := request uri queryAt: 'code' ifAbsent: [ '' ].
	  ZnResponse ok: (ZnEntity
	    text: (code = ''
	      ifTrue: [ 'Onenote login failed.' ]
	      ifFalse: [
	        self loginWithCode: code.
	        'Logged into OneNote. ' ,
	        'You can close this browser tab.' ]) )]
]

{ #category : #login }
TsOneNoteClient >> loginWithCode: code [
  |json|
  json := ZnClient new 
    url: 'https://login.live.com/oauth20_token.srf';
    formAt: #grant_type put: 'authorization_code';
    formAt: #client_id put: clientId;
    formAt: #code put: code;
    formAt: #redirect_uri put: self redirectUri;
    post.
  token := STONJSON fromString: json.
]

{ #category : #login }
TsOneNoteClient >> loginWithCode: code secret: secret [
  token := ZnClient new 
    url: 'https://login.live.com/oauth20_token.srf';
    formAt: #grant_type put: 'authorization_code';
    formAt: #client_id put: clientId;
    formAt: #code put: code;
    formAt: #redirect_uri put: self redirectUri;
    post.
]

{ #category : #login }
TsOneNoteClient >> redirectUri [
  ^ 'http://localhost:8989/callback'
]

{ #category : #accessing }
TsOneNoteClient >> token [
  ^ token
]

{ #category : #login }
TsOneNoteClient >> tokenFlowUrl [
  "!! for token flow logins. not yet used here."
  "https://learn.microsoft.com/en-us/previous-versions/office/office-365-api/how-to/onenote-auth#token-flow"
  ^ ('https://login.live.com/oauth20_authorize.srf',
     '?response_type=token',
     '&client_id=', clientId,
     '&scope=office.onenote+wl.signin+wl.offline_access',
     '&redirect_uri=', self redirectUri)
     asUrl

]
