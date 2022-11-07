import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:merchant/services/request.dart';
import 'package:rxdart/subjects.dart';

class HelperNotification {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final onNotification = BehaviorSubject<String?>();

  static Future<void> initialize() async {
    FirebaseMessaging.instance.getToken().then((value) => print(value));
    var androidInitializer = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializer = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: androidInitializer, iOS: iosInitializer);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) async {
      try {
        if (payload != null && payload.isNotEmpty) {
          onNotification.add(payload);
        }
      } catch (e) {
        print(e);
      }
      return;
    });
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
    FirebaseMessaging.onMessage.listen((RemoteMessage msg) {
      print('===========onMessage===================');
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage msg) {});
  }

  static Future _notificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails(
          'channel_id_gettheskydoctors',
          'channel name',
          channelDescription: 'channel_description',
          importance: Importance.max,
          enableVibration: true,
        ),
        iOS: IOSNotificationDetails());
  }

  static Future showNotification(FlutterLocalNotificationsPlugin plugin, {int id = 0, title, body, payload}) async {
    final largeIcon = await ApiServices.downloadFile('url', DateTime.now().toString());
    final styleInformation = BigPictureStyleInformation(
        FilePathAndroidBitmap(''),
        largeIcon: FilePathAndroidBitmap(largeIcon));
    plugin.show(id, title, body, await _notificationDetails(),
        payload: payload);
  }
}
