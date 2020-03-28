Class {
	#name : #BaselineOfTinyBlog,
	#superclass : #BaselineOf,
	#category : #BaselineOfTinyBlog
}

{ #category : #baselines }
BaselineOfTinyBlog >> baseline: spec [
	<baseline>
	
	spec for: #'common' do: [
		spec baseline: 'PharoWeb' with: [ spec repository: 'github://LucFabresse/PharoWeb/src' ].
		spec package: 'TinyBlog'.
		spec group: 'default' with: #( 'TinyBlog' )
	]
]
