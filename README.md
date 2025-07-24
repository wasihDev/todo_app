
## App Demo
<video src="./demo.mov" width="320" height="200" controls preload></video>

# ToDo App with API & Shimmer UI

A Flutter application that fetches todos from JSONPlaceholder API and displays them with a shimmer loading effect.

## Features

- Fetch todos from API with loading and error states
- Shimmer loading effect while data is being fetched
- Pull-to-refresh functionality
- Add new todos locally
- Toggle todo completion status
- Swipe to delete with undo functionality
- Clean architecture with Provider state management

## How to Run

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app

## Dependencies

- http: For API calls
- provider: For state management
- shimmer: For loading effects

## Folder Structure

- `models/`: Contains data models
- `providers/`: Contains state management logic
- `services/`: Contains API service
- `screens/`: Contains app screens
- `widgets/`: Contains reusable widgets
