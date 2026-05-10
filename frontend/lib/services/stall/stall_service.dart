import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/models/stall_model.dart';

class StallService {
  final Dio? _dio;

  StallService({dio}) : _dio = dio;

  Future<List<StallResponseModel>> getStalls() async {
    try {
      Response response = await _dio!.get('/stalls/');
      if (kDebugMode) {
        print(response.data.toString());
      }
      // Explicit pala ha
      return (response.data as List)
          .map<StallResponseModel>(
            (stall) =>
                StallResponseModel.fromJson(stall as Map<String, dynamic>),
          )
          .toList();
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
      Response response = await _dio!.get('/stalls/$stallId/with-categories');
      if (kDebugMode) {
        print(response.data.toString());
      }
      return StallWithCategories.fromJson(response.data as Map<String, dynamic>);
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
