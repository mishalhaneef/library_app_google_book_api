# Book Catelog App [Machine test]

 this is a machine test doing for [delopus.com](https://www.delopus.com/project)'s machine test

## Task
- login screen
- user dashboard
- api integration
- Better UI
- provider state management
- mvvm architecture

# Techstacks I used

- Flutter - Mobile Development sdk by google
- provider statemanagement - easy to implement and code
- Google Api - book api from google
- MVVM - model-view-view_model architecture. soo easy to understand the code 
- http - future-based library for making HTTP requests


## Run The Project

Go to terminal and run the command
> code .

> flutter emulators --launch < emulator id >

> flutter run

### install and test the application

- to install on emulator from your IDE try this command
> flutter build apk --split-per-abi    
> flutter install 

or try on your physical. download from [here](https://drive.google.com/file/d/1h0tQGT9v0kWYFVQ-fTNNGQzHMiqYmfuL/view?usp=sharing)

## What's I Done

- Registration Screen

a Simple registration screen with username, age and favourite book. and this data will be display in dashboard, also in the home page drawer.

- Home Screen 

integrated google book api, and fetches the data to book list sections. 

- Book Screen (Secong Screen)

used matrix 4 for book swiping effectt. matrix4 is a 4x4 matrix. with 4x4 matrix we can build 3d animations and things in 2d surface. we need 4d matrix to transform an object in 3 dimension.

- Audio Book Screen

tried to use the audio_player package but faces some bug. so i didn't implement the audio player in to this app. but you can see the UI

## Bugs and Problem 

in the audioplayer faces a lot of bugs and issue. and i dropped the idea due to lack of time.

tried to implement another book category for bottom section (for you section) of the application. but faces some issue. trying to implement that now. you can see the two defferent code for implementing two category in repository folder 

#### trying to fix these problem right now, after that will push this again

