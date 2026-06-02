import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:frontend/services/auth/token_refresh_interceptor.dart';
import 'package:frontend/services/auth/token_storage_impl.dart';
// https://medium.com/@edawarekaro/secure-authentication-in-flutter-implementing-refresh-tokens-with-dio-e3ebef1f56ef

final dioProvider = Provider<Dio>((ref) {
  final Dio dio = Dio(BaseOptions(
      baseUrl: "https://sufferer-cuddly-commerce.ngrok-free.dev/",
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      sendTimeout: Duration(seconds: 30),
      contentType: 'application/json',
      headers: {'ngrok-skip-browser-warning': 'true',}
  ));
  // Set up token storage
  final secureStorage = const FlutterSecureStorage();
  final tokenStorage = TokenStorageImpl(secureStorage);

  // Set up token refresh interceptor
  final tokenRefreshInterceptor = TokenRefreshInterceptor(tokenStorage);
  final fresh = tokenRefreshInterceptor.fresh;

  // Add the Fresh interceptor to Dio
  dio.interceptors.add(fresh);

  // Log out listener to handle authentication failures
  fresh.authenticationStatus.listen((status) {
    if (status == AuthenticationStatus.unauthenticated) {
      // Navigate to login screen or show login dialog
      print('User needs to login again');
    }
  });
  dio.interceptors.add(LogInterceptor()); // Logger

  return dio;
});