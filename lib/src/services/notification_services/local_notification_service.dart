import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final LocalNotificationService _localNotificationService =
      LocalNotificationService._internal();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  LocalNotificationService._internal();

  factory LocalNotificationService() {
    return _localNotificationService;
  }

  // initialization after widget initialized in main function
  Future<void> init() async {
    const AndroidInitializationSettings _initSettingAndroid = AndroidInitializationSettings('app_icon');

    final IOSInitializationSettings _initSettingIOS = IOSInitializationSettings(
        requestSoundPermission: false,
        requestAlertPermission: false,
        requestBadgePermission: false,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: _initSettingAndroid, iOS: _initSettingIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String? payload) async {}

  Future onDidReceiveLocalNotification(
      int value, String? x, String? y, String? z) async {}
}

// for generate a local notification
/*

// android platform specific
const AndroidNotificationDetails androidPlatformChannelSpecifics =
AndroidNotificationDetails(
    channelId: String,   //Required for Android 8.0 or after
    channelName: String, //Required for Android 8.0 or after
    channelDescription: String, //Required for Android 8.0 or after
    importance: Importance,
    priority: Priority
);

// ios plat form specific
const IOSNotificationDetails iOSPlatformChannelSpecifics =
IOSNotificationDetails(
    presentAlert: bool?,  // Present an alert when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
    presentBadge: bool?,  // Present the badge number when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
    presentSound: bool?,  // Play a sound when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
    sound: String?,  // Specifics the file path to play (only from iOS 10 onwards)
    badgeNumber: int?, // The application's icon badge number
    attachments: List<IOSNotificationAttachment>?, (only from iOS 10 onwards)
    subtitle: String?, //Secondary description  (only from iOS 10 onwards)
    threadIdentifier: String? (only from iOS 10 onwards)
);

const NotificationDetails platformChannelSpecifics =
NotificationDetails(iOS: iOSPlatformChannelSpecifics, android: androidPlatformChannelSpecifics);

await flutterLocalNotificationsPlugin.show(
int id,
    String? title,
String? body,
    NotificationDetails? notificationDetails,
String? payload);*/
