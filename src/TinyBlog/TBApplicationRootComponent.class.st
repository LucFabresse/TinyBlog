"
I am the entry point class of the TinyBlog application.
To start it execute: 

	ZnZincServerAdaptor startOn: 8080
"
Class {
	#name : #TBApplicationRootComponent,
	#superclass : #WAComponent,
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

{ #category : #rendering }
TBApplicationRootComponent >> renderContentOn: html [
	html text: 'TinyBlog'
]

{ #category : #updating }
TBApplicationRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'TinyBlog'
]
