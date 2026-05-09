import 'package:dio/dio.dart';
import 'package:frontend/models/stall_model.dart';

class StallService {
  final Dio? _dio;

  StallService({dio}) : _dio = dio;

  Future<List<StallResponseModel>> getStalls() async {
    List<StallResponseModel> stalls = [];
    try {
      Response response = await _dio!.get('/stalls/');
      print(response.data.toString());
      for(var stall in response.data) {
        stalls.add(StallResponseModel.fromJson(stall));
      }
      return stalls;
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

  Future<StallResponseModel> getStall(int stallId) async {
    try {
      Response response = await _dio!.get('/$stallId');
      return StallResponseModel.fromJson(response.data);
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

  Future<StallWithCategories> getStallWithCategories(int stallId) async {
    try {
      Response response = await _dio!.get('/$stallId/with-categories');
      return StallWithCategories.fromJson(response.data);
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

  Future<dynamic> updateStall(int stallId, StallUpdateModel update) async {
    try {
      Response response = await _dio!.put('/$stallId', data: update.toJson());
      print(response.data.toString());
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
