import 'package:dio/dio.dart';

class StallService {
  final Dio? _dio;

  StallService({dio}) : _dio = dio;

  Future<dynamic> getStalls() async {
    try {
      Response response = await _dio!.get('/stalls/');
      print(response.data.toString());
    } on DioException catch (e) {
      /// Tangina inaantok nako
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final errorData = e.response?.data;

        if (statusCode == 500) {
          final errorMessage = errorData['detail'] ?? 'Database error';
          throw Exception(errorMessage);
        } else {
          throw Exception(
            'Server error: $statusCode = ${errorData['detail'] ?? "Unknown Error"}',
          );
        }
      } else {
        throw Exception('Network error: ${e.message}');
      }
    }
  }

  Future<dynamic> getStall(int stallId) async {
    try {
      Response response = await _dio!.get('/$stallId');
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final errorData = e.response?.data;

        if (statusCode == 500) {
          final errorMessage = errorData['detail'] ?? 'Database error';
          throw Exception(errorMessage);
        } else if (statusCode == 404) {
          final errorMessage = errorData['detail'] ?? 'Stall not found';
          throw Exception(errorMessage);
        } else {
          throw Exception(
            'Server error: $statusCode = ${errorData['detail'] ?? "Unknown Error"}',
          );
        }
      } else {
        throw Exception('Network error: ${e.message}');
      }
    }
  }

  Future<dynamic> getStallWithCategories(int stallId) async {
    try {
      Response response = await _dio!.get('/$stallId/with-categories');
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final errorData = e.response?.data;

        if (statusCode == 500) {
          final errorMessage = errorData['detail'] ?? 'Database error';
          throw Exception(errorMessage);
        } else if (statusCode == 404) {
          final errorMessage = errorData['detail'] ?? 'Stall not found';
          throw Exception(errorMessage);
        } else {
          throw Exception(
            'Server error: $statusCode = ${errorData['detail'] ?? "Unknown Error"}',
          );
        }
      } else {
        throw Exception('Network error: ${e.message}');
      }
    }
  }

  Future<dynamic> updateStall(int stallId) async {
    try {
      Response response = await _dio!.get('/$stallId');
    } on DioException catch (e) {

      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final errorData = e.response?.data;

        if (statusCode == 400) {
          final errorMessage = errorData['detail'] ?? 'Database error';
          throw Exception(errorMessage);
        } else {
          throw Exception(
            'Server error: $statusCode = ${errorData['detail'] ?? "Unknown Error"}',
          );
        }
      } else {
        throw Exception('Network error: ${e.message}');
      }
    }
  }
}
