Class {
	#name : #TBPostsReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'blog'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'instance creation' }
TBPostsReport class >> filteredDescriptionsFrom: aBlogPost [
	"Filter only some descriptions for the report columns."
	^ aBlogPost magritteDescription
		select: [ :each | #(title category date) includes: each accessor selector ]
]

{ #category : #'instance creation' }
TBPostsReport class >> from: aBlog [
	| report blogPosts |
	blogPosts := aBlog allBlogPosts.
	report := self
		rows: blogPosts
		description: (self filteredDescriptionsFrom: blogPosts anyOne).
	report blog: aBlog.
	report addCommands.
	^ report
]

{ #category : #operations }
TBPostsReport >> addCommands [
	self addColumn: (MACommandColumn new
				addCommandOn: self selector: #viewPost: text: 'View';
				yourself;
				addCommandOn: self selector: #editPost: text: 'Edit';
				yourself;
				addCommandOn: self 
					selector: #deletePost:
					text: 'Delete';
				yourself).
]

{ #category : #crud }
TBPostsReport >> addPost [
    | post |
    post := self call: (self renderAddPostForm: TBPost new).
    post ifNotNil: [
        blog writeBlogPost: post.
        self refreshReport
    ]
]

{ #category : #accessing }
TBPostsReport >> blog [
   ^ blog
]

{ #category : #accessing }
TBPostsReport >> blog: aTBBlog [
   blog := aTBBlog
]

{ #category : #crud }
TBPostsReport >> deletePost: aPost [
    (self confirm: 'Do you want remove this post ?')
        ifTrue: [ blog removeBlogPost: aPost.
                 self refreshReport ]
]

{ #category : #crud }
TBPostsReport >> editPost: aPost [
   | post |
   post := self call: (self renderEditPostForm: aPost).
   post ifNotNil: [ blog save ]
]

{ #category : #operations }
TBPostsReport >> refreshReport [
    self rows: blog allBlogPosts.
    self refresh.
]

{ #category : #rendering }
TBPostsReport >> renderAddPostForm: aPost [
    ^ aPost asComponent
        addDecoration: (TBSMagritteFormDecoration buttons: { #save -> 'Add post' .  #cancel -> 'Cancel'});
        yourself
]

{ #category : #rendering }
TBPostsReport >> renderContentOn: html [
	html tbsGlyphIcon iconPencil.
	html anchor
		callback: [ self addPost ];
		with: 'Add post'.
	super renderContentOn: html
]

{ #category : #rendering }
TBPostsReport >> renderEditPostForm: aPost [
   ^ aPost asComponent addDecoration: (
      TBSMagritteFormDecoration buttons: {
         #save -> 'Save post'.
         #cancel -> 'Cancel'});
      yourself
]

{ #category : #rendering }
TBPostsReport >> renderViewPostForm: aPost [
	^ aPost asComponent
		addDecoration:
			(TBSMagritteFormDecoration buttons: {(#cancel -> 'Back')});
			   readonly: true;
		yourself
]

{ #category : #crud }
TBPostsReport >> viewPost: aPost [
   self call: (self renderViewPostForm: aPost)
]
