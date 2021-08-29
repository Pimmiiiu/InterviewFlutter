# Interview Problems for Flutter. (Codium)

## Solve (No.1 - 4 just make the function to show in the console - no need to make UI)

#### No.1
You can tap on the Button "Tap to print No.1" on the main page to print the answer. (print in console)

#### No.2
There is a text field "Enter Year" that can put the year and can be checked by pressing the "Tap to print No.2" button. (print in console)

#### No.3 - No.4
There is a text field "Enter number" that can enter numbers and check by pressing the button according to the topic. (print in console)

#### No.5 
You can tap on the Button "Tap to Basic layout No.5" to go to Basic layout page.

#### No.6 
You can tap on the Button "Tap to Codium Login page No.6" to go to Codium Login page.

#### No.7 
You can tap on the Button "Tap to Person page No.7" to go to Person page.
* use BLoC Pattern for state management.
* First, go to person main page to check current state.
  * On person main page I add event GetPersonPage for go to Person Page.
* Second, on Person Page that can click the card to change the page to edit page (I add event GetEditProfile for go to Edit profile Page).
* Lastly, on Edit profile page that details can be changed. When you want to save you can make changes by clicking the "save" button to save the profile data. But if you don't want to change anything you can click the back button to go back to Person Page.

