Class {
	#name : #TBPostTest,
	#superclass : #TestCase,
	#category : #'TinyBlog-Tests'
}

{ #category : #tests }
TBPostTest >> testPostIsCreatedCorrectly [
	| tmp1 |
	tmp1 := TBPost
		title: 'Welcome to TinyBlog'
		text: 'TinyBlog is a small blog engine made with Pharo.'
		category: 'TinyBlog'.
	self
		assert: tmp1 title equals: 'Welcome to TinyBlog';
		assert: tmp1 text
			equals: 'TinyBlog is a small blog engine made with Pharo.'
]

{ #category : #tests }
TBPostTest >> testWithoutCategoryIsUnclassified [
	| tmp1 |
	tmp1 := TBPost
		title: 'Welcome to TinyBlog'
		text: 'TinyBlog is a small blog engine made with Pharo.'.
	self
		assert: tmp1 title equals: 'Welcome to TinyBlog';
		assert: tmp1 isUnclassified;
		deny: tmp1 isVisible
]
