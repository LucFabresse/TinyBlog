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
	#category : #'TinyBlog-Model'
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

{ #category : #'magrittes-descriptions' }
TBPost >> descriptionCategory [
    <magritteDescription>
    ^ MAStringDescription new
        label: 'Category';
        priority: 300;
        accessor: #category;
        comment: 'Unclassified if empty';
        componentClass: TBSMagritteTextInputComponent;
        yourself
]

{ #category : #'magrittes-descriptions' }
TBPost >> descriptionContainer [
    <magritteContainer>
    ^ super descriptionContainer
        componentRenderer: TBSMagritteFormRenderer;
        yourself
]

{ #category : #'magrittes-descriptions' }
TBPost >> descriptionDate [
   <magritteDescription>
   ^ MADateDescription new
      label: 'Date';
      priority: 400;
      accessor: #date;
      beRequired;
      yourself
]

{ #category : #'magrittes-descriptions' }
TBPost >> descriptionText [
    <magritteDescription>
    ^ MAMemoDescription new
        label: 'Text';
        priority: 200;
        accessor: #text;
        beRequired;
        requiredErrorMessage: 'A blog post must contain a text.';
        comment: 'Please enter a text';
        componentClass: TBSMagritteTextAreaComponent;
        yourself
]

{ #category : #'magrittes-descriptions' }
TBPost >> descriptionTitle [
    <magritteDescription>
    ^ MAStringDescription new
        label: 'Title';
        priority: 100;
        accessor: #title;
        requiredErrorMessage: 'A blog post must have a title.';
        comment: 'Please enter a title';
        componentClass: TBSMagritteTextInputComponent;
        beRequired;
        yourself
]

{ #category : #'magrittes-descriptions' }
TBPost >> descriptionVisible [
    <magritteDescription>
    ^ MABooleanDescription new
        checkboxLabel: 'Visible';
        priority: 500;
        accessor: #visible;
        componentClass: TBSMagritteCheckboxComponent;
        beRequired;
        yourself
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
