"
A simple component to display a post.
"
Class {
	#name : #TBPostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'post'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #accessing }
TBPostComponent >> date [
   ^ post date
]

{ #category : #initialization }
TBPostComponent >> initialize [
	super initialize.
	post := TBPost new
]

{ #category : #accessing }
TBPostComponent >> post: aPost [
	post := aPost

]

{ #category : #rendering }
TBPostComponent >> renderContentOn: html [
	html heading level: 2; with: self title.
	html heading level: 6; with: self date.
	html text: self text
]

{ #category : #accessing }
TBPostComponent >> text [
   ^ post text
]

{ #category : #accessing }
TBPostComponent >> title [
   ^ post title
]
