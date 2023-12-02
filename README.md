# Book Catalog App

## Overview

Welcome to the Book Catalog App, a Flutter-based mobile application designed to manage and explore your book collection. This app incorporates various technologies to provide a seamless user experience, including Google's Book API for fetching book data, the Provider package for state management, and the MVVM (Model-View-ViewModel) architecture for clear code organization.

## Tech Stack

- **Flutter:** Google's SDK for mobile development.
- **Provider State Management:** An easy-to-implement state management solution.
- **Google API:** Utilizing the Google Book API to fetch book-related data.
- **MVVM Architecture:** Embracing the Model-View-ViewModel architecture for clarity and maintainability.
- **HTTP Package:** Using the HTTP package for making asynchronous HTTP requests.

## Run The Project

To run the project locally, follow these steps:

1. Open your terminal and run:
   ```bash
   code .
   ```
2. Launch your preferred emulator:
   ```bash
   flutter emulators --launch <emulator_id>
   ```
3. Run the project:
   ```bash
   flutter run
   ```

### Installation and Testing

Install the app on an emulator using the following commands:

```bash
flutter build apk --split-per-abi
flutter install
```

Alternatively, download and install the app on your physical device [here](https://drive.google.com/file/d/1P0Xbh9NxrhV_1hIkPosK_QpgXyr1K3_D/view?usp=sharing).

## Key Features

### Registration Screen

- Simple registration capturing username, age, and favorite book.
- Displaying this data on the dashboard and the home page drawer.

### Home Screen

- Integration with Google Book API to fetch and display book data.

### Book Screen (Second Screen)

- Utilizing Matrix4 for a visually appealing book-swiping effect.
- Implementing a 4x4 matrix for 3D animations on 2D surfaces.

### Audio Book Screen

- Attempted integration of the audio_player package for audiobook functionality.
- Due to bugs, audio features are pending completion.

## App Flow

1. **Registration:**
   - Login with your name and age, redirected to the dashboard.

2. **Dashboard:**
   - Navigate to the home page to fetch API data.

![Fetch API](https://i.postimg.cc/NfHL19Zj/Whats-App-Image-2022-10-09-at-10-12-54-AM.jpg)

## Known Issues

- Audioplayer faces bugs and issues; audio features are not implemented yet.
- Working on fixing problems related to additional book category implementation.

### Ongoing Work

Continuously addressing bugs and issues, with a focus on implementing additional features for a smoother user experience.
