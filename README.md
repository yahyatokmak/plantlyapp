Requirements

  - Flutter 3.38.0+ (Dart 3.10.1+)
  - iOS 13.0+ / Android SDK 24+

  Getting Started

  # Install dependencies
  flutter pub get

  # Generate code (freezed models)
  dart run build_runner build --delete-conflicting-outputs

  # Run app
  flutter run

  Build

  # Android APK
  flutter build apk --release

  # iOS
  flutter build ios --release

  Project Structure

  lib/
  ├── core/
  │   ├── constants/      # App constants
  │   ├── network/        # Dio client & error handling
  │   ├── router/         # GoRouter configuration
  │   ├── storage/        # SharedPreferences wrapper
  │   ├── theme/          # Colors, text styles
  │   └── widgets/        # Reusable widgets
  └── features/
      ├── home/           # Home page (Bloc)
      ├── onboarding/     # Onboarding flow
      └── paywall/        # Subscription screen

  Tech Stack

  - State Management: flutter_bloc
  - Networking: Dio
  - Routing: GoRouter
  - Data Classes: Freezed + JSON Serializable
  - Image Caching: cached_network_image
  - Local Storage: SharedPreferences
