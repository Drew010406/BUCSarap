import 'package:firebase_messaging/firebase_messaging.dart';


class FireBaseService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<String> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print("FCM TOKEN: $fcmToken");
    FirebaseMessaging.onMessage.listen(messageHandler);

    FirebaseMessaging.onMessageOpenedApp.listen(messageOpenedAppHandler);
    return fcmToken!;
  }

  void messageHandler(RemoteMessage message) {
    print("Foreground Title: ${message.notification?.title}");
    print("Foreground Body: ${message.notification?.body}");
    print("Foreground Payload: ${message.data}");
  }

  void messageOpenedAppHandler(RemoteMessage message) {
    print("Opened App Title: ${message.notification?.title}");
    print("Opened App Body: ${message.notification?.body}");
    print("Opened App Payload: ${message.data}");
  }
}
