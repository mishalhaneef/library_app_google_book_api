# Book Catalog App

# Techstacks I used

- Flutter - Mobile Development sdk by google
- provider statemanagement - easy to implement and code
- Google Api - book api from google
- MVVM - model-view-view_model architecture. it is easy to understand the code 
- http - future-based library for making HTTP requests


## Run The Project

Go to terminal and run the command
> code .

> flutter emulators --launch < emulator id >

> flutter run

### Install and test the application

- To install on emulator from your IDE try this command
> flutter build apk --split-per-abi    
> flutter install 

Or try on your physical device. download from [here](https://drive.google.com/file/d/1P0Xbh9NxrhV_1hIkPosK_QpgXyr1K3_D/view?usp=sharing)


## What I Did

- #### Registration Screen
A Simple registration screen with username, age, and favorite book. And this data will be displayed in the dashboard, and also in the home page drawer.

- #### Home Screen 
Integrated google book API, and fetches the data to book list sections.

- #### Book Screen (Second Screen)
Used matrix 4 for the book swiping effect. matrix4 is a 4x4 matrix. With a 4x4 matrix, we can build 3d animations and things on 2d surfaces. We need a 4d matrix to transform an object in 3 dimensions.

- #### Audio Book Screen
Tried to use the audio_player package but faced some bugs. So I didn't implement the audio player into this app, but you can see the UI



## How the app works

- Here you can login with your name and age. And you will be redirected to dashboard, from There you can go to home page.
There you can find a button to fetch the api datas on the top right.

![Fetch API](https://i.postimg.cc/NfHL19Zj/Whats-App-Image-2022-10-09-at-10-12-54-AM.jpg)


## Bugs and Problems

In the audioplayer faces a lot of bugs and issues. And I dropped the idea due to lack of time.
tried to implement another book category for the bottom section (for you section) of the application. But faces some issues. Trying to implement that now. You can see the two different codes for implementing two categories in the repository folder

### Trying to fix these problems right now, after I will push this again

