import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_project_arch/src/business_logics/utils/log_debugger.dart';
import 'package:flutter_project_arch/src/services/shared_preference_services/shared_prefs_services.dart';

class PushNotificationServices {
  static late FirebaseMessaging _firebaseMessaging;

  // set up firebase push notification settings
  static void setUpFirebase(navigatorKey) async {
    _firebaseMessaging = FirebaseMessaging.instance;
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LogDebugger.instance.i('Got a message whilst in the foreground!');
      LogDebugger.instance.i('Message data: ${message.notification}');
      // do whatever you want to do for your foreground task required by SRS
    });
  }

  // set up firebase cloud messaging token
  static void getFirebaseCloudMessagingToken() async {
   /** check if your user is logged in or not
    if user logged in and your token was saved then it will get, either it will generate a new token **/

    String? deviceToken = SharedPrefsServices.getStringData('device_token');
    if (deviceToken == null || deviceToken == '') {
      _firebaseMessaging.getToken().then((token) {
        LogDebugger.instance.i("_firebaseMessaging.getToken : $token");
        _saveFCMTokenToPrefs(token!);
      });
    } else {
      // store you token where it needs
    }
  }

  // save fcm token to shared prefs if not available
  static Future<void> _saveFCMTokenToPrefs(String deviceToken) async {
      SharedPrefsServices.setStringData('device_token', deviceToken);
  }

}