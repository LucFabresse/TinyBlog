"
A simple component to manage a list of categories
"
Class {
	#name : #TBCategoriesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'categories',
		'postsList'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'instance creation' }
TBCategoriesComponent class >> categories: categories postsList: aTBScreen [
	^ self new categories: categories; postsList: aTBScreen
]

{ #category : #accessing }
TBCategoriesComponent >> categories [
	^ categories sort
]

{ #category : #accessing }
TBCategoriesComponent >> categories: aCollection [
	categories := aCollection copy.
	categories add: 'All'.
	categories := categories asSortedCollection
]

{ #category : #accessing }
TBCategoriesComponent >> postsList [
	^ postsList
]

{ #category : #accessing }
TBCategoriesComponent >> postsList: aComponent [
	postsList := aComponent
]

{ #category : #rendering }
TBCategoriesComponent >> renderCategoryLinkOn: html with: aCategory [
	html tbsLinkifyListGroupItem
		class: 'active' if: aCategory = self postsList currentCategory;
		callback: [ self selectCategory: aCategory ];
		with: aCategory
]

{ #category : #rendering }
TBCategoriesComponent >> renderContentOn: html [
	html tbsListGroup: [
		html tbsListGroupItem
			with: [  html strong: 'Categories' ].
		categories do: [ :cat |
			self renderCategoryLinkOn: html with: cat ] ]
]

{ #category : #actions }
TBCategoriesComponent >> selectCategory: aCategory [
	postsList currentCategory: aCategory
]
