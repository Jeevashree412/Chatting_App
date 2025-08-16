# Chatting_App

A modern, cross-platform chat application built with **Flutter** and **Dart**, leveraging Firebase for real-time communication and authentication. The app is designed to provide seamless chatting experiences, easy contact management, and robust user support—all backed by scalable cloud services.

## Overview

**Chatting_App** is a feature-rich chat client that enables users to sign in securely, manage contacts, chat in real time, seek help, and update their profile details. The app is structured for scalability, maintainability, and ease of use, making it an ideal foundation for personal messaging platforms or as a base for further extension.

## Features

- **User Authentication:** Secure sign in and sign out using Firebase Authentication.
- **Contacts Management:** View, search, and interact with your contacts.
- **General Chat:** One-on-one messaging with real-time updates via Firestore.
- **Help Me:** Access a dedicated help channel for support or FAQs.
- **Profile Management:** View and edit your profile name and details.
- **Navigation Bar:** Easily switch between key sections of the app.

## Technologies Used

- **Flutter** & **Dart**: For fast, cross-platform UI development.
- **Firebase Authentication**: Handles user login and registration.
- **Firestore Database**: Stores messages and user data with real-time sync.
- **Firebase Core**: For app initialization and backend services.
- **Router & Navigation Bar**: Manages screen navigation and routing logic.

## Usage

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- A Firebase project (with Authentication & Firestore enabled)
- Android/iOS device or emulator

### Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Jeevashree412/Chatting_App.git
   cd Chatting_App
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Configuration**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
   - Register your app (Android/iOS) and download the necessary configuration files:
     - `google-services.json` for Android (place in `android/app`)
     - `GoogleService-Info.plist` for iOS (place in `ios/Runner`)
   - Enable **Authentication** and **Firestore Database** in Firebase console.

4. **Run the App**
   ```bash
   flutter run
   ```

## App Structure

```
lib/
├── main.dart                   # App entry point
├── routers/                    # Routing configuration
├── screens/
│   ├── contacts.dart           # Contacts UI
│   ├── general_chat.dart       # General chat screen
│   ├── help_me.dart            # Help/Support screen
│   ├── profile.dart            # Profile management
│   ├── sign_in.dart            # Sign in screen
│   └── sign_out.dart           # Sign out logic
├── services/
│   ├── firebase_service.dart   # Firebase initialization
│   └── firestore_service.dart  # Firestore data handling
└── widgets/
    └── navigation_bar.dart     # Bottom navigation bar widget
```

## Screenshots

<!-- Add screenshots of key screens here for visual reference -->

## Contributing

Contributions, issues, and feature requests are welcome!  
Feel free to check [issues page](https://github.com/Jeevashree412/Chatting_App/issues) or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Author

**Jeevashree412**  
[GitHub Profile](https://github.com/Jeevashree412)

---

For support or queries, open an issue or contact the author through [GitHub](https://github.com/Jeevashree412/Chatting_App/issues).  
