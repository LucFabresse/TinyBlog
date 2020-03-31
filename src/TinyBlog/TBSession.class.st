"
I represent a session.
we can store information there and share it among all components of the Seaside  application.
"
Class {
	#name : #TBSession,
	#superclass : #WASession,
	#instVars : [
		'currentAdmin'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #accessing }
TBSession >> currentAdmin [
	^ currentAdmin
]

{ #category : #accessing }
TBSession >> currentAdmin: anObject [
	currentAdmin := anObject
]

{ #category : #testing }
TBSession >> isLogged [
    ^ self currentAdmin notNil
]

{ #category : #actions }
TBSession >> reset [
   currentAdmin := nil.
	self requestContext redirectTo: self application url.
	self unregister.
]
