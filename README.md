# Flutter Starter Template

![coverage][coverage_badge]
This template is meant as a good starting point for any app. It includes:
- routing
- initialization
- authentication
- logging
- exception reporting
- analytics
- purchases
- flavors
- tests

It makes use of other packages defined in this mono-repo.


## Deep Links 🔗
Just follow [this](https://codewithandrea.com/articles/flutter-deep-links/) awesome guide. 

Template app has been tested and works with deep links.

---

## App Icon 📱
Use [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) package (which supports flavors).

Comments:
- Android foreground icon needs a lot of padding to work well

Other options:
- https://pub.dev/packages/icons_launcher

---

## Splash Screen 💧
Use [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) package (which supports flavors).

Comments:
- Launcher icon is used by default on Android 12+

---

## App Name & ID 🔤
### Flutter - `pubspec.yaml`
```yaml
name: new_app_name
```

### Android 
Follow TODOs in the following files
- `android/app/build.gradle`
- `android/app/main/AndroidManifest.xml`
- `android/app/main/kotlin/**` - Update the folder structure to match package name
- `android/app/main/kotlin/**/MainActivity.kt`

### iOS 
- `ios/Runner/Info.plist`
- Runner Bundle Identifier

---

## Environment variables 🌱
It is expected that there are 3 `.env` files:
- `.development.env`
- `.staging.env`
- `.production.env`

These are not checked into source control.

[flutter_dotenv](https://pub.dev/packages/flutter_dotenv) package is used to load the relevant file during initialization. Variables can be accessed like so:
```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';
dotenv.env['VAR_NAME'];
```

Secrets and API keys should ideally **not** be stored in envrionment variables. Although better than coding them into a `String` they can still be accessed by someone with access to the compiled app. It is better to never give the client access to the keys and handle any code that requires the keys in a trusted environement (e.g. a server).

---

## Theming 🌈
Theming is all handled in the `lib/theme` directory.

Colours are generated using the [FlexSeedScheme](https://pub.dev/packages/flex_seed_scheme) package as this offers a more flexible way of generated a colour palette by allowing you to pass in more than just a primary colour.

There is a common colour scheme which should include most theming options unless colour is involved. This common theme is then copied to generate the light and dark themes.

`app.dart` includes `DynamicColorBuilder` which injects the OS's colour scheme which then updates the app's colour scheme by harminising with it.


### Extensions
Theme extensions provide a robust mechanism to extend and customize the default theming capabilities. Currently implemented are:
- `SpacingTheme` - Sizes that will mostly be used for padding and gap spacing.
- `DurationTheme` - Different durations that can be used by animations so the app uses consistent timings throughout.
- `ModalTheme` - Defines the min and max width for modals which can then be used to constrain dialogs.
- `SemanticColorsTheme` - Specifies colours with meaning. E.g. success, warning, error, info. This extension is specified in the specific colour scheme as the colours should be harmonized with the primary colour to maintain consistency.
- `RadiusTheme` - Defines different sizes of radius to be used throughout the app.

### Text scale factor clamper
This widget wraps the entire app and prevents the font from getting too big or small when the user has adjusted the font size in the OS settings. Although it would be ideal to not have to do this, some apps just can't handle it if the font gets too large.

---

## Toast Messages 🍞
Showing user transient toast messages is handled using the [toastification](https://pub.dev/packages/toastification) package. There are a number of custom extensions for showing pre-configured types of messages (info, warning, error, success). These can be shown by calling `toastification.error(...)`.

There is also a top level widget called `ToastificationConfigProvider` which provides some global settings.

---

## Logging 🪵
Logging is handled using the [logger](https://pub.dev/packages/logger) package. It is configured in `bootstrap.dart` with some custom filters and outputs. The default setup is to log and output everything in `development` and `staging` environments but only errors and higher in `production` and only if it is in not in debug mode. I.e. If the app is in release mode and the `production` flavour, nothing gets printed to the console and only errors (and worse) will be logged to a repository (e.g. Crashlytics).

`Riverpod` has an observer which logs changes using `logger`. Any errors observed by `Riverpod` are logged at the `warning` level so as to not log errors to the output unless explicitly called, either by calling a method on the `LoggingRepository` or `logger.e()`.

```dart
ref.read(errorLoggingRepositoryProvider).logException(...);
ref.read(loggerProvider).e(...);
```

For any logging that is required "above" the domain level (e.g. Repositories), use `developer.log()` and include the `name` parameter.

Note: There is [currently a bug](https://pub.dev/packages/logger#colors) where printed outputs don't look good on MacOS.

---

## Analytics 📈
As the different analytics SDKs can have quite different APIs I have created an `AnalyticsFacade` that encompasses the complexity of wrangling the different platforms. This will contain methods for tracking events that are important to the bussiness and can then call methods on the relevant repositories.

For example; screen tracking may be desirable for sending to Google Analytics and Mixpanel, but not so useful for sending to Branch.

---

## CI/CD 🚝

---

## Exceptions ⚠️
There is an extension for `Object` which will loop through all known `Exception` and `Error` types and create a helpful error message for the user.
When creating new exceptions, you should add a suitable error message to the relevant `.arb` files and add it as an option in `app_exceptions.dart`.

There is also a helpful function that will take a plain `Exception` type and remove the `Exception: ` prefix and return it as a `String`.

---

## Flavors 😋

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Flutter Starter Template works on iOS, Android, Web, and Windows._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

I was having issues where the generated file would be in the `.dart-tool` directory so I followed [this SO answer](https://stackoverflow.com/a/78257261) and it worked.

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:flutter_starter_template/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

### Generating Translations

To use the latest translations changes, you will need to generate them:

1. Generate localizations for the current project:

```sh
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

Alternatively, run `flutter run` and code generation will take place automatically.

## Notes 📝


[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
