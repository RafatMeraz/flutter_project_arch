import 'package:flutter/material.dart';

abstract class PlatformButton {
  factory PlatformButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidRaisedButton();
      case TargetPlatform.iOS:
        return IOSRaisedButton();
      default:
        return WebRaisedButton();
    }
  }

  Widget build(
      {required BuildContext context,
      required Widget child,
      required Color backgroundColor,
      required Color textColor,
      required double borderRadius,
      required VoidCallback onPressed});
}

class AndroidRaisedButton implements PlatformButton {
  @override
  Widget build(
      {required BuildContext context,
      required Widget child,
      required Color backgroundColor,
      required Color textColor,
      required double borderRadius,
      required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 8),
          textStyle: TextStyle(fontSize: 15, color: textColor)),
      child: child,
    );
  }
}

class IOSRaisedButton implements PlatformButton {
  @override
  Widget build(
      {required BuildContext context,
        required Widget child,
        required Color backgroundColor,
        required Color textColor,
        required double borderRadius,
        required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 8),
          textStyle: TextStyle(fontSize: 15, color: textColor)),
      child: child,
    );
  }
}

class WebRaisedButton implements PlatformButton {
  @override
  Widget build(
      {required BuildContext context,
        required Widget child,
        required Color backgroundColor,
        required Color textColor,
        required double borderRadius,
        required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 8),
          textStyle: TextStyle(fontSize: 15, color: textColor)),
      child: child,
    );
  }
}
