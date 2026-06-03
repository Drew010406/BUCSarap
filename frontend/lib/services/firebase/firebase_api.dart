import 'package:firebase_messaging/firebase_messaging.dart';

@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("Opened App Title: ${message.notification?.title}");
  print("Opened App Body: ${message.notification?.body}");
  print("Opened App Payload: ${message.data}");
}
class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<String> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    print("Token: $token");
    return token!;
    
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}