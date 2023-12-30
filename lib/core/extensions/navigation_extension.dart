import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<void> navigateTo(String routeName, {Object? arguments}) =>
      Navigator.pushNamed(this, routeName, arguments: arguments);
  Future<void> navigateToReplacement(String routeName, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);

  popUntilFirst() => Navigator.popUntil(this, (route) => route.isFirst);
  popWhenPoppable() => Navigator.canPop(this) ? Navigator.pop(this) : null;
  pop() => Navigator.pop(this);
  unfocus() => FocusScope.of(this).unfocus();
}
