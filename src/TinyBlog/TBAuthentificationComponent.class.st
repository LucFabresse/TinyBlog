Class {
	#name : #TBAuthentificationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'password',
		'account',
		'component'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'instance creation' }
TBAuthentificationComponent class >> from: aComponent [
   ^ self new
      component: aComponent;
      yourself
]

{ #category : #accessing }
TBAuthentificationComponent >> account [
   ^ account
]

{ #category : #accessing }
TBAuthentificationComponent >> account: anObject [
   account := anObject
]

{ #category : #accessing }
TBAuthentificationComponent >> component [
   ^ component
]

{ #category : #accessing }
TBAuthentificationComponent >> component: anObject [
   component := anObject
]

{ #category : #accessing }
TBAuthentificationComponent >> password [
   ^ password
]

{ #category : #accessing }
TBAuthentificationComponent >> password: anObject [
   password := anObject
]

{ #category : #rendering }
TBAuthentificationComponent >> renderAccountFieldOn: html [
   html
      tbsFormGroup: [ html label with: 'Account'.
         html textInput
            tbsFormControl;
            attributeAt: 'autofocus' put: 'true';
            callback: [ :value | account := value ];
            value: account ]
]

{ #category : #rendering }
TBAuthentificationComponent >> renderBodyOn: html [
    html
        tbsModalBody: [
            html tbsForm: [
                self renderAccountFieldOn: html.
                self renderPasswordFieldOn: html.
                html tbsModalFooter: [ self renderButtonsOn: html ]
]]
]

{ #category : #rendering }
TBAuthentificationComponent >> renderButtonsOn: html [
   html tbsButton
      attributeAt: 'type' put: 'button';
      attributeAt: 'data-dismiss' put: 'modal';
      beDefault;
      value: 'Cancel'.
   html tbsSubmitButton
      bePrimary;
      callback: [ self validate ];
      value: 'SignIn'
]

{ #category : #rendering }
TBAuthentificationComponent >> renderContentOn: html [
   html tbsModal
      id: 'myAuthDialog';
      with: [
         html tbsModalDialog: [
            html tbsModalContent: [
               self renderHeaderOn: html.
               self renderBodyOn: html ] ] ]
]

{ #category : #rendering }
TBAuthentificationComponent >> renderHeaderOn: html [
   html
      tbsModalHeader: [
         html tbsModalCloseIcon.
         html tbsModalTitle
            level: 4;
            with: 'Authentication' ]

]

{ #category : #rendering }
TBAuthentificationComponent >> renderPasswordFieldOn: html [
   html tbsFormGroup: [


       html label with: 'Password'.
      html passwordInput
         tbsFormControl;
         callback: [ :value | password := value ];
         value: password ]
]

{ #category : #rendering }
TBAuthentificationComponent >> validate [
  ^ component tryConnectionWithLogin: self account andPassword: self
password

]
