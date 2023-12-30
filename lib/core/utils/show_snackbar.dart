import 'package:flutter/material.dart';
import 'package:personal_website/app/home/home.dart';

showSnackbar(SnackBar snackbar) {
  return ScaffoldMessenger.of(globalContext).showSnackBar(snackbar);
}
