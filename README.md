# Fit App Frontend

Flutter frontend for a generic fitness class and event management application.

The goal of this project is to provide a reusable Flutter application for organizing fitness and health-related activities. Users will be able to browse available classes and subscribe to events created by instructors.

The application is designed to be configurable so that different organizations can adapt the application to their own branding, localization, and backend configuration while using the same codebase.

## Requirements

- Flutter SDK
- Dart SDK
- A supported Android development environment for Android builds or any other target device

You can verify your Flutter installation with:

```bash
flutter doctor
```

## Getting Started

Clone the repository and install the project dependencies:

```bash
git clone <repository-url>
cd <repository-directory>
flutter pub get
```

Before building the application, create the application configuration file from the provided template:

```bash
cp config/config.template.yaml config/config.yaml
```

Then modify config/config.yaml according to your deployment.

config/config.yaml is intended to contain organization-specific configuration and should not be committed to the public repository.

## Configuration

The application uses YAML configuration files to separate organization-specific settings from the application source code.

### Application configuration

The file _config/config.yaml_ is in charge of the configuration of all application-specific properties, such us application name, branding and locales.

A template is provided in [config/config.template.yaml](/config/config.template.yaml).

Example:

```yaml
app:
  name: "My App"
  description: "App template for Fitness and Health."

branding:
  primary_color: "#FFFF2E05"
  logo_path: "assets/images/flutter_logo.png"

localization:
  default_locale: "en_US"
  supported_locales:
    - "en_US"
```

#### Configuration fields

| **Section** | **Field** | **Description** |
| ----------- | --------- | --------------- |
| app | name | Application name displayed to users |
| app | description | Application description |
| branding | primary_color | Primary color used by the application theme |
| branding | logo_path | Path for the application's logo asset |
| localization | default_locale | Default application locale |
| localization | supported_locales | List of locales supported by the application |

Additional configuration options may be added as the project evolves.

### Launcher icon configuration

Application launcher icons are generated using **flutter_launcher_icons**.

This configuration file (_**flutter_launcher_icons.yaml**_) will configure the plugin. An example is provided in [flutter_launcher_icons.example.yaml](/flutter_launcher_icons.example.yaml).

Example:

```yaml
flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/images/flutter_logo.png"
  min_sdk_android: 21 # android min sdk min:16, default 21

  web:
    generate: true
    image_path: "assets/images/flutter_logo.png"
```

A new configuration file can be generated using:

```bash
dart run flutter_launcher_icons:generate
```

For additional information of this plugin, see [Flutter Launch Icons](https://pub.dev/packages/flutter_launcher_icons) documentation.

## Building

### Generate application icons

After configuring the Launcher Icon assets, generate the application icons:

```bash
dart run flutter_launcher_icons
```

### Android

Build an Android APK with:

```bash
flutter build apk
```

### Web

Build the web application with:

```bash
flutter build web
```

Additional information about Flutter deployment and release processes is available in [Flutter deployment documentation](https://docs.flutter.dev).

## Project Structure

The project follows a feature-oriented structure intended to keep application functionality separated and maintainable.

```
fit_app_frontend/
|---- flutter_launcher_icons.yaml
|---- pubsec.yaml
|
|---- lib/
|     |---- config/
|     |     |---- app_config.dart
|     |     |---- app_config_provider.dart
|     |
|     |---- layouts/
|     |     |---- calendar.dart
|     |     |---- layout.dart
|     |
|     |
|     |---- src/
|     |     |---- activity.dart
|     |     |---- utils.dart
|     |
|     |---- main.dart
|
|---- config/
|     |---- config.yaml
|
|---- assets/
|     |---- images/
|           |---- icon.png
```

## License

This project is licensed under the **GNU General Public License v3.0**. See LICENSE file for details.