"
I am a Seaside component dedicated to the management of posts.
"
Class {
	#name : #TBAdminComponent,
	#superclass : #TBScreenComponent,
	#category : #'TinyBlog-Components'
}

{ #category : #initialization }
TBAdminComponent >> createHeaderComponent [
         ^ TBAdminHeaderComponent from: self

]

{ #category : #actions }
TBAdminComponent >> goToPostListView [
        self answer
]

{ #category : #rendering }
TBAdminComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
		html heading: 'Blog Admin'.
		html horizontalRule ]
]
