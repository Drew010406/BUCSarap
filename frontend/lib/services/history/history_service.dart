import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HistoryService {
  final Dio? _dio;
  HistoryService({dio}): _dio=dio;

  Future<dynamic> getProductInfo(int productID) async {
    try {
      Response response = await _dio!.get("/products/products/$productID");
      if(kDebugMode) {
        print(response.data.toString());
      }
      return response.data;
    } on DioException catch(e) {
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

  Future<dynamic> getStallRevenue(int stallID) async {
    try {
      Response response = await _dio!.get("/history/revenue/$stallID");
      if(kDebugMode) {
        print(response.data.toString());
      }
      return response.data;
    } on DioException catch (e) {
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
}