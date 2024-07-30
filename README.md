# News App

## Overview
News App is a Flutter-based mobile application that delivers up-to-date news articles to users, leveraging the Google News API. This README provides comprehensive information for developers to set up, run, and contribute to the project effectively.

## Table of Contents
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
  - [Flutter Version](#flutter-version)
  - [Dependencies](#dependencies)
  - [Environment Configuration](#environment-configuration)
- [Running the App](#running-the-app)
- [Rate Limiting](#rate-limiting)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)
- [Support](#support)

## Project Structure
```
lib/
┣ api/
┣ configs/
┣ enum/
┣ helpers/
┣ hooks/
┣ mock/
┣ models/
┣ provider/
┣ utils/
┣ widgets/
┣ app.dart
┗ main.dart
```

## Prerequisites
Before you begin, ensure you have the following installed:
- [Flutter](https://flutter.dev/docs/get-started/install) (version 3.19.6)
- [FVM](https://fvm.app/documentation/getting-started/installation) (Flutter Version Management)

## Setup

### Flutter Version
This project is developed using Flutter version 3.19.6. Set up the correct version using FVM:

```shell
fvm use 3.19.6
```

### Dependencies
Install project dependencies by running:

```shell
fvm flutter pub get
```

### Environment Configuration
1. Obtain API credentials from the [Google News API on RapidAPI](https://rapidapi.com/bfd-id/api/google-news13) (freemium plan).
2. Create a `.env` file in the project root directory based on the `.env.example` template:

```env
API_ENDPOINT=
X_RAPIDAPI_KEY=
X_RAPIDAPI_HOST=
```

3. Generate the Dart environment configuration file:

```shell
fvm dart run build_runner build --delete-conflicting-outputs
```

## Running the App

1. List available devices:

```shell
fvm flutter devices
```

2. Run the app on your chosen device:

```shell
fvm flutter run -d {YOUR_DEVICE_ID}
```

## Rate Limiting
If you encounter rate limiting issues with the API, you can use mock data instead. Modify the `/api/get_news_by_category.dart` file as follows:

```dart
final getNewsByCategoryProvider = FutureProvider.autoDispose.family<NewsModel, GetNewsByCategoryParam>((ref, param) async {
  return mockGetNewsByCategory(param.newsCategory);
});
```

## Testing

### Generate Coverage Report
To generate the test coverage information, run:

```shell
flutter test --coverage
```

### Create HTML Report
Note: On macOS, you need to have lcov installed (`brew install lcov`).

Generate an HTML report with the following command:

```shell
genhtml coverage/lcov.info -o coverage/html
```

### View the Report
Open the generated HTML report in your default web browser:

```shell
open coverage/html/index.html
```

## Contributing
We welcome contributions to the News App project. Before submitting pull requests, please read our [contributing guidelines](CONTRIBUTING.md).

## License
This project is licensed under the [MIT License](LICENSE).

## Support
If you encounter any issues or have questions, please [file an issue](https://github.com/yourusername/news_app/issues) on the GitHub repository.
