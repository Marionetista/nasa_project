# nasa_project

A new Flutter project. 
Each day a different image or photograph of our fascinating universe is featured, along with a brief explanation written by a professional astronomer.

## Getting Started
This project is a starting point for a Flutter application.
[Get Started](https://flutter.dev/docs/get-started/install)

## Run app
flutter run

## Run Tests
flutter test

## Show Tests Coverage

Install lcov in your mac:

```brew install lcov```

After, run command for generate tests:

```flutter test --coverage```

Generate files for show coverage tests:

```genhtml -o coverage coverage/lcov.info```

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Dependencies

  # http: ^0.13.5
    -A composable, multi-platform, Future-based API for HTTP requests.
    - Dart Package: <https://pub.dev/packages/http>
    - GitHub: <hhttps://github.com/dart-lang/http/tree/master/pkgs/http>
    - License: [BSD-3-Clause](https://pub.dev/packages/http/license)

  # flutter_bloc: ^8.1.3
    -Used to separate presentation from business logic. Following the BLoC pattern facilitates testability and reusability.
    - Dart Package: <https://pub.dev/packages/bloc>
    - GitHub: <https://github.com/felangel/bloc>
    - License: [MIT](https://github.com/felangel/bloc/blob/master/LICENSE)

  # equatable: ^2.0.5
    -Comparsion simplified.
    - Dart Package: <https://pub.dev/packages/equatable>
    - GitHub: <https://github.com/felangel/equatable>
    - License: [MIT](https://pub.dev/packages/equatable/license)