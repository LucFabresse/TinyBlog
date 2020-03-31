"
A  TBPost is a blog post.


"
Class {
	#name : #TBPost,
	#superclass : #Object,
	#instVars : [
		'category',
		'date',
		'text',
		'title',
		'visible'
	],
	#category : #TinyBlog
}

{ #category : #'instance creation' }
TBPost class >> title: aTitle text: aText [ 
	^ self new
		title: aTitle;
		text: aText;
		yourself
]

{ #category : #'instance creation' }
TBPost class >> title: aTitle text: aText category: aCategory [
	^ (self title: aTitle text: aText)
			category: aCategory;
			yourself
]

{ #category : #constants }
TBPost class >> unclassifiedTag [
	^ 'Unclassified'
]

{ #category : #action }
TBPost >> beVisible [
   self visible: true
]

{ #category : #accessing }
TBPost >> category [
	^ category
]

{ #category : #accessing }
TBPost >> category: aString [
	category := aString

]

{ #category : #accessing }
TBPost >> date [
	^ date
]

{ #category : #accessing }
TBPost >> date: aDate [
	date := aDate
]

{ #category : #initialization }
TBPost >> initialize [
	super initialize.
	self category: self class unclassifiedTag.
	self date: Date today.
	self notVisible
]

{ #category : #testing }
TBPost >> isUnclassified [
   ^ self category = self class unclassifiedTag
]

{ #category : #testing }
TBPost >> isVisible [
   ^ self visible
]

{ #category : #action }
TBPost >> notVisible [
   self visible: false
]

{ #category : #accessing }
TBPost >> text [
	^ text
]

{ #category : #accessing }
TBPost >> text: aString [
	text := aString
]

{ #category : #accessing }
TBPost >> title [
	^ title
]

{ #category : #accessing }
TBPost >> title: aString [
	title := aString
]

{ #category : #accessing }
TBPost >> visible [
	^ visible
]

{ #category : #accessing }
TBPost >> visible: aBoolean [
	visible := aBoolean
]
