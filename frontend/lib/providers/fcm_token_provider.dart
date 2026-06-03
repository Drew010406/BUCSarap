import 'package:flutter_riverpod/flutter_riverpod.dart';

class FcmTokenProvider extends Notifier<String?> {
  @override
  String? build() {
    return null;
  }
   void addToken(String token) {
    state = token;
   }
}

final fcmTokenNotifierProvider = NotifierProvider<FcmTokenProvider, String?>(() {
  return FcmTokenProvider();
});