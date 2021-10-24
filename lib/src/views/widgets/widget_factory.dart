import 'package:flutter/material.dart';
import 'package:flutter_project_arch/src/views/widgets/button_factory.dart';

class WidgetFactory {
  static Widget buildButton(
      {required BuildContext context,
      required Widget child,
      required Color backgroundColor,
      required double borderRadius,
      required Color textColor,
      required VoidCallback onPressed}) {
    return PlatformButton(Theme.of(context).platform).build(
        context: context,
        child: child,
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        borderRadius: borderRadius,
        textColor: textColor);
  }
}
