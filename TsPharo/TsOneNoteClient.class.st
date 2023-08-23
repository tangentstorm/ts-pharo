Class {
	#name : #TsOneNoteClient,
	#superclass : #Object,
	#instVars : [
		'token'
	],
	#category : #'TsPharo-OneNote'
}

{ #category : #accessing }
TsOneNoteClient >> fromConfig: aPath [
  | d url |
  
  d := STONJSON fromString: aPath asFileReference contents.

  url := 'https://login.microsoftonline.com/',
         (d at: #tenantId), '/oauth2/v2.0/token'.
  d := {
    'grant_type' -> 'client_credentials'.
    'client_id' -> (d at: #clientId).
    'client_secret' -> (d at: #clientSecret).
    'scope' -> 'https://graph.microsoft.com/.default'
  } asDictionary.

  token := (STONJSON fromString: (ZnClient new url: url;
     formAddAll: d;
     post)).
]

{ #category : #accessing }
TsOneNoteClient >> listOneNotePages [
  ^ ZnClient new
    url: 'https://graph.microsoft.com/v1.0/me/onenote/pages';
    headerAt: 'Authorization' put: 'Bearer ',token;
    get
]

{ #category : #accessing }
TsOneNoteClient >> listOneNotePagesFor: userId [
  ^ ZnClient new
    url: 'https://graph.microsoft.com/v1.0/users/', userId, 'onenote/pages';
    headerAt: 'Authorization' put: 'Bearer ', (token at:#access_token);
    get
]

{ #category : #accessing }
TsOneNoteClient >> token [
  ^ token
]
