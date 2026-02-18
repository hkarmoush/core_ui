# Core UI Package

The `core_ui` package is the centralized design system for the application. It provides the foundational building blocks—colors, typography, spacing—and a suite of reusable, platform-adaptive widgets to ensure a consistent and high-quality user interface.

## Features

- **Design Tokens**: Standardized definitions for colors, typography, spacing, radius, and shadows.
- **Theme**: Centralized `AppTheme` configuration for Light and Dark modes.
- **Reusable Widgets**: A collection of stateless and stateful widgets for common UI patterns.
- **Platform Adaptation**: Widgets that automatically render as Material (Android) or Cupertino (iOS/macOS) styles based on the platform.

## Installation

Add `core_ui` as a dependency in your `pubspec.yaml`:

```yaml
dependencies:
  core_ui:
    path: packages/core_ui
```

## Usage

Import the package in your Dart files:

```dart
import 'package:core_ui/core_ui.dart';
```

### 1. Design Tokens

Use design tokens to maintain visual consistency. Avoid hardcoding colors or values.

- **Colors**: Access atomic colors via `AppColors`.

  ```dart
  Color primary = AppColors.primary;
  Color background = AppColors.background;
  ```

- **Typography**: accessible via `context` `Theme` or `AppTypography` (though using `Theme.of(context).textTheme` is recommended for flexibility).

  ```dart
  Text('Headline', style: Theme.of(context).textTheme.headlineMedium);
  ```

- **Spacing**: Use `AppSpacing` for margins, padding, and gaps.

  ```dart
  Padding(
    padding: const EdgeInsets.all(AppSpacing.md), // 16.0
    child: ...
  );
  Gap(AppSpacing.lg) // 24.0
  ```

- **Radius**: Use `AppRadius` for border radiuses.
  ```dart
  BorderRadius.circular(AppRadius.lg)
  ```

### 2. Theming

Configure your app's theme in `main.dart`:

```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  // ...
)
```

### 3. Components

#### Display Widgets

- **AppCard**: A styled card container.
- **AppAvatar**: Displays user image or initials.
- **AppBadge**: Notification or status badge.
- **AppChip**: Action or choice chip.
- **AppDivider**: Standardized list or section divider.
- **AppListTile**: Common list item with leading/trailing support.

#### Input Widgets

- **AppButton**: Supports `primary`, `secondary`, `outline`, and `ghost` variants.
  ```dart
  AppButton(
    text: 'Submit',
    type: AppButtonType.primary,
    onPressed: () {},
  )
  ```
- **AppTextField**: Standardized text input field with validation support.
- **AppSwitch**: Adaptive switch.
- **AppCheckbox**: Adaptive checkbox.
- **AppRadio**: Adaptive radio button.
- **AppSlider**: Adaptive slider.
- **AppSegmentedControl**: Adaptive segmented control (Cupertino style on iOS, SegmentedButton on Android).

#### Feedback Widgets

- **AppLoadingIndicator**: Adaptive circular progress indicator.
- **AppEmptyState**: Full-view widget for empty datasets.
- **AppErrorWidget**: Full-view widget for error states with retry mechanism.

#### Dialogs & Pickers

These methods use static `show` functions for convenience and auto-adapt to the platform style.

- **AppDialog**:
  ```dart
  AppDialog.show(
    context: context,
    title: 'Confirm',
    content: 'Are you sure?',
    actions: [
      TextButton(child: Text('Cancel'), onPressed: ...),
      TextButton(child: Text('OK'), onPressed: ...),
    ],
  );
  ```
- **AppBottomSheet**: Shows a modal bottom sheet (CupertinoActionSheet on iOS).
- **AppDatePicker**: Shows platform-native date picker.
- **AppTimePicker**: Shows platform-native time picker.

## Architectural Usage

The `core_ui` package is a **Foundation Layer** package. It is designed to be a singleton dependency for all UI-related concerns across the application ecosystem.

### 1. In Feature Packages

All feature packages (e.g., `feature_auth`, `feature_home`) should list `core_ui` as a dependency.

**Do:**

- Import `package:core_ui/core_ui.dart` in your feature widgets.
- Use `AppColors`, `AppTypography`, and `AppSpacing` for all layout and styling.
- Use `AppButton`, `AppCard`, and other atomic widgets to build complex page layouts.

**Don't:**

- Hardcode hex colors (e.g., `Color(0xFF...)`).
- Create custom `InputDecoration` or `ButtonStyle` unless strictly necessary (extend `AppTheme` instead).
- Import `material.dart` mixed with raw styling logic; rely on `core_ui` primitives.

### 2. In the Main Application

The root application (the composition root) is responsible for injecting the theme into the widget tree.

```dart
// main.dart or app.dart
import 'package:core_ui/core_ui.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Super App',

      // Apply the centralized theme
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // ... routing and other config
    );
  }
}
```

### 3. Cross-App Sharing

Since `core_ui` is a standalone package with no dependencies on domain or data layers, it can be shared across multiple apps (e.g., a Customer App and an Admin Panel) within the same monorepo. This ensures brand consistency across different products.

## Development

### Directory Structure

```
lib/
├── src/
│   ├── theme/          # AppTheme configuration
│   ├── tokens/         # Atomic design tokens (colors, spacing, etc.)
│   └── widgets/        # Reusable components
│       ├── buttons/
│       ├── dialogs/
│       ├── display/
│       ├── feedback/
│       ├── inputs/
│       └── pickers/
└── core_ui.dart        # Barrel file exporting public API
```

### Running Tests

This package is 100% test covered. logic. Run tests using:

```bash
flutter test
```
