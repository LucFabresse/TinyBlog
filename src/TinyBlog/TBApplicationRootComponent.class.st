"
A simple class to register the application to the Seaside application server.
I'm the entry point of the application. 

Point your browser to 
	http://localhost:8080/TinyBlog

If it does not work, check that the server is running

	ZnZincServerAdaptor startOn: 8080.
	
I point to my main element that is an instance of a subclass of ScreenComponent 
"
Class {
	#name : #TBApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #testing }
TBApplicationRootComponent class >> canBeRoot [
   ^ true
]

{ #category : #initialization }
TBApplicationRootComponent class >> initialize [
   "self initialize"
   | app |
   app := WAAdmin register: self asApplicationAt: 'TinyBlog'.
   app
      addLibrary: JQDeploymentLibrary;
      addLibrary: JQUiDeploymentLibrary;
      addLibrary: TBSDeploymentLibrary
]

{ #category : #hooks }
TBApplicationRootComponent >> children [
	^ { main }
]

{ #category : #initialization }
TBApplicationRootComponent >> initialize [
	super initialize.
	main := TBPostsListComponent new
]

{ #category : #accessing }
TBApplicationRootComponent >> main: aComponent [
	main := aComponent
]

{ #category : #rendering }
TBApplicationRootComponent >> renderContentOn: html [
	html render: main
]

{ #category : #updating }
TBApplicationRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'TinyBlog'
]
