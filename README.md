# Erkam Dev Personal Website
This project is the source code of the [erkam.dev](erkam.dev) website, built with Flutter.

## Packages/Dependencies
- [Get It](https://pub.dev/packages/get_it)
- [BloC](https://pub.dev/packages/bloc)
- [Equatable](https://pub.dev/packages/equatable)
- [Dartz](https://pub.dev/packages/dartz)
- [Dio](https://pub.dev/packages/dio)
- [Hive](https://pub.dev/packages/hive)
- [Firebase](https://pub.dev/packages/firebase_core)
- [Remote Config](https://pub.dev/packages/firebase_remote_config)
- [Analytics](https://pub.dev/packages/firebase_analytics)
- [Animations](https://pub.dev/packages/animations)
- [Google Fonts](https://pub.dev/packages/google_fonts)
- [Webviewx Plus](https://pub.dev/packages/webviewx_plus)
- [Url Launcher](https://pub.dev/packages/url_launcher)

## Customization & Notes
If you want to use this project as a template, you will need to modify the following files and code snippets:

- `lib/firebase_options.dart`: Add your own Firebase settings file in lib folder.
- `.vscode/tasks.json`: Replace the values with your own domain address and username to run build & deploy task.
- Project should built with the `--html-renderer` flag to display images without encountering CORS errors. If you have your own hosting or proxy, this will not be an issue.
