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
		spec package: 'TinyBlog' with: [ spec requires: #('PharoWeb') ].
		spec package: 'TinyBlog-Tests' with: [ spec requires: #('TinyBlog') ].
		
		spec group: 'default' with: #( 'TinyBlog' 'TinyBlog-Tests' )
	]
]
