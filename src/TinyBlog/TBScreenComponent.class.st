"
Root of the elements that are represented inside the application root component. 
Subclasses are 
	- the user visible components such as list of blog posts
	- the admin components
"
Class {
	#name : #TBScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #accessing }
TBScreenComponent >> blog [
	"Return the current blog. In the future we will ask the session to return the blog of the currently logged in user."
	^ TBBlog current
]

{ #category : #hooks }
TBScreenComponent >> children [
   ^ { header }
]

{ #category : #initialization }
TBScreenComponent >> createHeaderComponent [
  ^ TBHeaderComponent from: self
]

{ #category : #initialization }
TBScreenComponent >> initialize [
	super initialize.
	header := self createHeaderComponent

]

{ #category : #rendering }
TBScreenComponent >> renderContentOn: html [
	html render: header
]
