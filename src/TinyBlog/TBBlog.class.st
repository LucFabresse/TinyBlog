"
a TBBlog represents a blog that contains posts
"
Class {
	#name : #TBBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #TinyBlog
}

{ #category : #'data sample' }
TBBlog class >> createDemoPosts [
   "TBBlog createDemoPosts"
   self current 
      writeBlogPost: ((TBPost title: 'Welcome in TinyBlog' text: 'TinyBlog is a small blog engine made with Pharo.' category: 'TinyBlog') visible: true);
      writeBlogPost: ((TBPost title: 'Report Pharo Sprint' text: 'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a nice event with more than 15 motivated sprinters. With the help of candies, cakes and chocolate, huge work has been done' category: 'Pharo') visible: true);
      writeBlogPost: ((TBPost title: 'Brick on top of Bloc - Preview' text: 'We are happy to announce the first preview version of Brick, a new widget set created from scratch on top of Bloc. Brick is being developed primarily by Alex Syrel (together with Alain Plantec, Andrei Chis and myself), and the work is sponsored by ESUG. 
      Brick is part of the Glamorous Toolkit effort and will provide the basis for the new versions of the development tools.' category: 'Pharo') visible: true);
      writeBlogPost: ((TBPost title: 'The sad story of unclassified blog posts' text: 'So sad that I can read this.') visible: true);
      writeBlogPost: ((TBPost title: 'Working with Pharo on the Raspberry Pi' text: 'Hardware is getting cheaper and many new small devices like the famous Raspberry Pi provide new computation power that was one once only available on regular desktop computers.' category: 'Pharo') visible: true)
]

{ #category : #singleton }
TBBlog class >> current [
	"answer the instance of the TBRepository"
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
  
]

{ #category : #'class initialization' }
TBBlog class >> initialize [ 
	self reset
]

{ #category : #accessing }
TBBlog class >> reset [
	"self reset"
	uniqueInstance := nil
]

{ #category : #accessing }
TBBlog >> allBlogPosts [
   ^ posts
]

{ #category : #accessing }
TBBlog >> allBlogPostsFromCategory: aCategory [
   ^ self allBlogPosts select: [ :p | p category = aCategory ]
]

{ #category : #accessing }
TBBlog >> allCategories [
   ^(self allBlogPosts collect: [ :p | p category ]) asSet
]

{ #category : #accessing }
TBBlog >> allVisibleBlogPosts [
   ^ self allBlogPosts select: [ :p | p isVisible ]
]

{ #category : #accessing }
TBBlog >> allVisibleBlogPostsFromCategory: aCategory [
   ^ self allBlogPosts select: [ :p | p category = aCategory and: [ p isVisible ] ]
]

{ #category : #initialization }
TBBlog >> initialize [
	super initialize.
	posts := OrderedCollection new
]

{ #category : #operations }
TBBlog >> removeAllPosts [
	posts := OrderedCollection new
]

{ #category : #accessing }
TBBlog >> size [
	 ^ posts size
]

{ #category : #operations }
TBBlog >> writeBlogPost: aPost [
	"Write the blog post in database"
	posts add: aPost
]
