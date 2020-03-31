Class {
	#name : #TBAdminHeaderComponent,
	#superclass : #TBHeaderComponent,
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBAdminHeaderComponent >> renderButtonsOn: html [
	html form: [ 
		self renderDisconnectButtonOn: html.
		self renderPublicViewButtonOn: html ]
]

{ #category : #rendering }
TBAdminHeaderComponent >> renderDisconnectButtonOn: html [
   html tbsNavbarButton 
      tbsPullRight; 
      callback: [ self session reset ];
      with: [  
         html text: 'Disconnect '.
         html tbsGlyphIcon iconLogout ]
]

{ #category : #rendering }
TBAdminHeaderComponent >> renderPublicViewButtonOn: html [
   self session isLogged ifTrue: [ 		 
      html tbsNavbarButton 
         tbsPullRight; 
         callback: [ component goToPostListView ];
         with: [  
            html tbsGlyphIcon iconEyeOpen.
            html text: ' Public View' ]]
]
