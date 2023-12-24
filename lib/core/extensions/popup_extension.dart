import 'package:flutter/material.dart';

extension SnackbarExtensions on BuildContext {
  void showSnackbar({String? message, Widget? child, SnackBarAction? action}) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: child ?? Text(message ?? ""),
        action: action,
      ),
    );
  }

  void hideCurrentSnackBar() =>
      ScaffoldMessenger.of(this).hideCurrentSnackBar();
  void removeCurrentSnackBar() =>
      ScaffoldMessenger.of(this).removeCurrentSnackBar();
}
