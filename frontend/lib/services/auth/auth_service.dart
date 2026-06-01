import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/models/auth_token_pair.dart';
import 'package:frontend/models/owner_model.dart';
import 'package:frontend/services/auth/token_storage_impl.dart';

class AuthService {
  final Dio? _dio;
  final TokenStorageImpl _tokenStorageImpl = TokenStorageImpl(const FlutterSecureStorage());

  AuthService({dio}) : _dio = dio;


  Future<dynamic> loginUser(OwnerModel userData) async {
    try {
      Response response = await _dio!.post(
        '/users/login',
        data: FormData.fromMap({
          'username': userData.username,
          'password': userData.password,
        }),
      );

      if(response.statusCode == 200) {
        print('Response data: ${response.data}');
        _tokenStorageImpl.write(
            AuthTokenPair.fromJson(response.data)
        );
      }
      return response;
    } on DioException catch(e) {
      if(e.response != null) {
        final statusCode = e.response?.statusCode;
        final errorData = e.response?.data;

        if(statusCode == 401) {
          final errorMessage = errorData?['detail'] ?? 'Incorrect username or password';
          throw Exception(errorMessage);
        } else {
          throw Exception('Server error: $statusCode - ${errorData?['detail'] ?? 'Unknown Error'}');
        }
      } else {
        throw Exception('Network error: ${e.message}'); // No response was received
      }
    }
  }

  Future<Response?> checkAuth() async {
    final token = await _tokenStorageImpl.read();
    if (token == null) return null;

    try {
      final response = await _dio!.get('/users/me');
      return response;
    } on DioException {
      return null;
    }
  }

}