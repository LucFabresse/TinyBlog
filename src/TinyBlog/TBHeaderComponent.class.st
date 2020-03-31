"
I am a simple component to manage the default header.
I am factorised on ScreenComponent.
 
"
Class {
	#name : #TBHeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'instance creation' }
TBHeaderComponent class >> from: aComponent [
         ^ self new
          component: aComponent;
          yourself
]

{ #category : #accessing }
TBHeaderComponent >> component [
         ^ component
]

{ #category : #accessing }
TBHeaderComponent >> component: anObject [
         component := anObject
]

{ #category : #rendering }
TBHeaderComponent >> rendeModalLoginButtonOn: html [
   html render: (TBAuthentificationComponent from: component).
   html tbsNavbarButton
      tbsPullRight;
      attributeAt: 'data-target' put: '#myAuthDialog';
      attributeAt: 'data-toggle' put: 'modal';
      with: [
         html tbsGlyphIcon iconLock.
         html text: ' Login' ]
]

{ #category : #rendering }
TBHeaderComponent >> renderBrandOn: html [
   html tbsNavbarHeader: [
      html tbsNavbarBrand
         url: self application url;
         with: 'TinyBlog' ]
]

{ #category : #rendering }
TBHeaderComponent >> renderButtonsOn: html [
    self session isLogged
        ifTrue: [ self renderSimpleAdminButtonOn: html ]
		  ifFalse: [ self renderModalLoginButtonOn: html ]  
]

{ #category : #rendering }
TBHeaderComponent >> renderContentOn: html [
    html tbsNavbar beDefault; with: [
       html tbsContainer: [
        self renderBrandOn: html.
        self renderButtonsOn: html
]]
]

{ #category : #rendering }
TBHeaderComponent >> renderModalLoginButtonOn: html [
         html render: (TBAuthentificationComponent from: component).
         html tbsNavbarButton
            tbsPullRight;
            attributeAt: 'data-target' put: '#myAuthDialog';
            attributeAt: 'data-toggle' put: 'modal';
            with: [
               html tbsGlyphIcon iconLock.
               html text: ' Login' ]
]

{ #category : #rendering }
TBHeaderComponent >> renderSimpleAdminButtonOn: html [
        html form: [
        html tbsNavbarButton
          tbsPullRight;
          callback: [ component goToAdministrationView ];
          with: [
              html tbsGlyphIcon iconListAlt.
              html text: ' Admin View' ]]
]
