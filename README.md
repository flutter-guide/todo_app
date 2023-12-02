# TODO-App

This is a todo application written in flutter. The project is from the Flutter Guide Community and aims for providing a learning and experimental space for developers of all skill levels.

## Info

1. Flutter Version: 3.13.8
2. Dart Version: 3.1.4

## Installation

### Get packages.

Run: ```flutter pub get```

### Setup Firebase

1. Add Email Authentication
2. Init Firestore Database
    3. Add ruleset ```rules_version = '2';
       service cloud.firestore {
       match /databases/{database}/documents {
       // Match any collection
       match /{collection}/{document=**} {
       // Ensure the collection name matches the user's ID
       allow read, write: if request.auth != null && request.auth.uid == collection;
       }
       }
       }```

### Connect Firebase with Flutter

1. `dart pub global activate flutterfire_cli`

2. `flutterfire configure`

## Fundamental decisions

- Framework: `Flutter`
- Database: `Firebase`
- Provider: `not decided yet`
