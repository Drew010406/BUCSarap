import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final Dio dio = Dio(BaseOptions(
      baseUrl: "http://10.0.2.2:8080",
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      sendTimeout: Duration(seconds: 30),
      contentType: 'application/json'
  ));

  dio.interceptors.add(LogInterceptor()); // Logger

  return dio;
});