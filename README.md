# Flutter Chat App

A real-time chat application built with Flutter.

## Features

- User authentication (basic username entry)
- Real-time messaging using WebSockets
- Local storage of messages using Hive
- State management using BLoC pattern

## Getting Started

1. Ensure you have Flutter installed on your machine.
2. Clone this repository: `git clone https://github.com/Prajwalvv/flutter_chat_app.git`
3. Navigate to the project directory: `cd flutter_chat_app`
4. Get the dependencies: `flutter pub get`
5. Run the app: `flutter run -d chrome`

## Project Structure

- `lib/main.dart`: The entry point of the application
- `lib/screens/`: Contains the UI screens (login, signup, chat)
- `lib/bloc/`: Contains the BLoC files for state management
- `lib/models/`: Contains the data models
- `lib/services/`: Contains the WebSocket and Hive services

## Dependencies

- web_socket_channel: ^2.4.0
- bloc: ^8.1.2
- flutter_bloc: ^8.1.3
- hive: ^2.2.3
- hive_flutter: ^1.1.0
- equatable: ^2.0.3


- Implement proper user authentication
- Add multiple chat rooms
- Implement message deletion and editing
- Add user profiles and avatars
