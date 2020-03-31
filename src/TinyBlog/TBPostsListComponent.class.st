"
I'm responsible for displaying a list of posts. I delegare to the post component the display of a single post.
I'm in the contact with a category component. 
"
Class {
	#name : #TBPostsListComponent,
	#superclass : #TBScreenComponent,
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBPostsListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
		self blog allVisibleBlogPosts do: [ :p |
			html render: (TBPostComponent new post: p) ] ]
]
