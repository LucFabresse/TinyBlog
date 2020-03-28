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
TBPost class >> title: arg1 text: arg2 [
	| tmp2 |
	tmp2 := self new.
	tmp2
		title: arg1;
		text: arg2.
	^ tmp2 yourself
]

{ #category : #'instance creation' }
TBPost class >> title: arg1 text: arg2 category: arg3 [
	| tmp2 |
	tmp2 := self title: arg1 text: arg2.
	tmp2 category: arg3.
	^ tmp2 yourself
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
TBPost >> category: arg1 [
	category := arg1
]

{ #category : #accessing }
TBPost >> date [
	^ date
]

{ #category : #accessing }
TBPost >> date: arg1 [
	date := arg1
]

{ #category : #initialization }
TBPost >> initialize [
	super initialize.
	self
		category: self class unclassifiedTag;
		date: Date today;
		notVisible
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
TBPost >> text: arg1 [
	text := arg1
]

{ #category : #accessing }
TBPost >> title [
	^ title
]

{ #category : #accessing }
TBPost >> title: arg1 [
	title := arg1
]

{ #category : #accessing }
TBPost >> visible [
	^ visible
]

{ #category : #accessing }
TBPost >> visible: arg1 [
	visible := arg1
]
