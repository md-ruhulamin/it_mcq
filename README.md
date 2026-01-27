
# IT MCQ — Flutter IT Job Preparation App

A mobile app built with Flutter to help users prepare for IT job interviews using multiple-choice questions (MCQs). This README has been updated to include the exact dependency list you provided, guidance for Firebase and native setup (since your project uses Firebase packages), and instructions for adding screenshots so the README will show how the app looks and works.

I updated the README to include:
- A clear dependency section with the packages you listed.
- Firebase setup notes and where to place configuration files.
- How to add screenshots and a recommended assets path.
- Run / build instructions tuned for a Flutter project that uses Firebase and local storage.

What's next: add your screenshots to assets/screenshots/, ensure the firebase config files (google-services.json and GoogleService-Info.plist) are present if you use Firebase, and push changes. If you want, provide your pubspec.yaml content and I'll validate/format it and embed the exact screenshots into this README.

## Table of Contents

- [Demo / Screenshots](#demo--screenshots)
- [Features](#features)
- [Built With / Dependencies](#built-with--dependencies)
- [Prerequisites](#prerequisites)
- [Getting Started (Run locally)](#getting-started-run-locally)
- [Firebase setup](#firebase-setup)
- [Project Structure](#project-structure)
- [Adding Screenshots to README](#adding-screenshots-to-readme)
- [Testing](#testing)
- [Building Release](#building-release)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)
- [Acknowledgements](#acknowledgements)

## Demo / Screenshots



<img src="https://github.com/md-ruhulamin/skill_stack/blob/main/Screenshot%20from%202025-11-06%2019-04-39.png" alt="App UI Preview" width="100%">


## Features

- Categorized MCQs for common IT topics (programming, data structures, databases, networking, OS, web, etc.)
- Timed quizzes and practice mode
- Progress tracking per topic and overall
- Bookmark / favorite questions for later review
- View correct answers and short explanations
- Offline support (questions stored locally using Hive / local DB)
- Authentication and social sign-in (Google, Apple, Firebase Auth)
- Push notifications (Firebase Messaging)
- Chat UI (flutter_chat_ui) and local caching of images
- Light/Dark theme support (optional)

## Built With / Dependencies

Add the following dependencies to your pubspec.yaml under the `dependencies:` section. These are the packages and versions as provided:

```yaml
dependencies:
  cupertino_icons: ^1.0.8
  google_fonts: ^6.3.2
  firebase_auth: ^6.1.1
  firebase_messaging: ^16.0.4
  google_sign_in: ^6.3.0
  sign_in_with_apple: ^7.0.1
  map_location_picker: ^2.0.3
  dio:
  flutter_chat_ui: ^1.6.15
  flutter_chat_types: ^3.6.2
  intl:
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  get_storage: ^2.1.1
  http: ^1.2.2
  jwt_decoder: ^2.0.1
  image_cropper: ^8.0.2
  shimmer: ^3.0.0
  fluttertoast: ^8.2.10
  image_picker: ^1.1.2
  cached_network_image: ^3.4.1
  phone_form_field: ^10.0.2
  shared_preferences: ^2.5.3
  flutter_bloc: ^9.1.1
  skeletonizer:
  firebase_core: ^4.2.0
  cloud_firestore: ^6.0.3
  salomon_bottom_bar: ^3.3.1
  flutter_local_notifications: ^19.5.0
  provider: ^6.1.5+1
  device_preview: ^1.3.1
```

Notes:
- A few packages above were provided without versions (dio, intl, skeletonizer). You can either leave them without a pinned version (to use the latest compatible) or replace them with a specific version that matches your project's tested configuration.
- After updating pubspec.yaml run:
```bash
flutter pub get
```

## Prerequisites

- Flutter SDK (stable channel). Confirm with:
```bash
flutter --version
```
- Android Studio, Xcode, or VS Code with Flutter extensions.
- A device or emulator to run the app.

Recommended Flutter: test with the version you developed the app with (if unknown, use latest stable).

## Getting Started (Run locally)

1. Clone the repository:
```bash
git clone https://github.com/md-ruhulamin/it_mcq.git
cd it_mcq
```

2. Add or verify the dependencies in `pubspec.yaml` (see dependency list above), then:
```bash
flutter pub get
```

3. If you use Firebase (recommended given firebase packages), follow the Firebase setup steps below.

4. Run the app:
```bash
flutter run
```

To run on a specific device:
```bash
flutter run -d <device-id>
```

## Firebase setup

Because your project uses firebase_core, firebase_auth, firebase_messaging, and cloud_firestore, complete the platform-specific setup:

Android:
1. In Firebase Console, add an Android app with your app's applicationId (from android/app/build.gradle).
2. Download `google-services.json` and place it in `android/app/`.
3. Add the Google services plugin to `android/build.gradle` and `android/app/build.gradle` as per Firebase Flutter docs.
4. Configure FCM and enable notifications. For flutter_local_notifications + firebase_messaging, follow integration steps in each package's docs.

iOS:
1. In Firebase Console, add an iOS app with your iOS bundle identifier.
2. Download `GoogleService-Info.plist` and add it to `ios/Runner/`.
3. Enable Push Notifications and Background Modes (Remote notifications) in Xcode capabilities.
4. For Sign in with Apple, configure the appropriate capabilities and keys in Apple Developer portal.

General:
- Initialize Firebase in your `main()`:
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```

- For Google Sign-In and Apple Sign-In, set up OAuth credentials in Firebase console and Apple Developer account respectively.
- If you use Firestore security rules or remote configs, configure them in the console.

If you prefer not to use Firebase during local development, guard Firebase-dependent code with runtime checks or use mocks.

## Project Structure (suggested)

- android/
- ios/
- lib/
  - main.dart
  - src/
    - screens/
    - widgets/
    - models/
    - services/
    - blocs/ or providers/
    - utils/
- assets/
  - screenshots/
  - data/ (question JSON files)
- test/
- pubspec.yaml

## Data / Questions Format

Example JSON question structure:
```json
{
  "id": "q1",
  "question": "What does HTTP stand for?",
  "options": [
    "HyperText Transfer Protocol",
    "High Transfer Text Protocol",
    "Hyperlink Transfer Protocol",
    "Home Transfer Text Protocol"
  ],
  "answer_index": 0,
  "explanation": "HTTP stands for HyperText Transfer Protocol.",
  "topic": "Networking",
  "difficulty": "easy"
}
```

Store question banks under `assets/data/` and load at runtime.

## Adding Screenshots to README

1. Create directory `assets/screenshots/` and add PNG or JPG images.
2. Commit them:
```bash
git add assets/screenshots/*
git commit -m "Add app screenshots"
git push
```
3. Embed them in this README where the Demo / Screenshots section is.

## Testing

Write unit and widget tests under `test/`. Example runs:
```bash
flutter test
```

## Building Release

Android:
```bash
flutter build apk --release
```
iOS:
```bash
flutter build ios --release
```
Follow Play Store and App Store publishing guides (signing, provisioning profiles, versioning).

## Contributing

1. Fork the repository
2. Create a branch: git checkout -b feat/your-feature
3. Make changes and tests
4. Push and open a pull request

Please run `flutter format` and include small, focused commits.

## Roadmap & Ideas

- Cloud sync of progress (Firestore)
- Leaderboard and achievements
- More question banks and topic filters
- Adaptive quizzes focusing on weak areas
- Localization / multi-language support

## License

Choose a license (e.g., MIT) and add a LICENSE file if you haven't already.

## Contact

Maintainer: md-ruhulamin  
GitHub: https://github.com/md-ruhulamin

If you'd like, share your actual `pubspec.yaml` and the screenshot images and I'll:
- Validate and format the dependency versions,
- Embed the real screenshots into this README,
- Add any missing native setup steps specific to the versions in your project.
