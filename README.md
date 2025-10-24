# Flutter ToDo Vanilla

A simple To-Do application built with Flutter.

## Project Overview

This project is a demonstration of a Flutter To-Do app built with a focus on manual state management and separation of concerns, without relying on third-party state management libraries or `StatefulWidget`.

The core principles of this project are:
- **No External State Management Libraries:** State is managed using vanilla Dart and Flutter concepts like `ValueNotifier` and `ChangeNotifier`.
- **Separation of Logic and UI:** The business logic is decoupled from the UI widgets, making the code cleaner, easier to maintain, and testable.
- **Stateless UI:** The UI is composed entirely of `StatelessWidget`s, with state changes being driven by `ValueListenableBuilder`s listening to notifiers.

## Project Structure

The project is structured to maintain a clear separation between different parts of the application:

-   `lib/model/`: Contains the data models for the application (e.g., `Todo`).
-   `lib/logic/`: Holds the business logic and state management (e.g., `TodoLogic`).
-   `lib/views/`: Contains the UI widgets for different screens of the app.
-   `lib/main.dart`: The entry point of the application.

This project serves as an example of how to build a reactive Flutter application using only the tools provided by the Flutter SDK.