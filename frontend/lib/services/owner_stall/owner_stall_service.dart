import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/models/product_model.dart';
import 'package:frontend/models/stall_model.dart';

class OwnerStallService {
  final Dio _dio;

  const OwnerStallService({required Dio dio}) : _dio = dio;

  Future<List<CategoryInfoModel>> getOwnerStallCategories(int ownerID, int stallID) async {
    try {
      Response response = await _dio.get("/owner_stallowners/1/stalls/1/categories");
      if(kDebugMode) {
        print(response.data.toString());
      }
      return (response.data as List).map((json) => CategoryInfoModel.fromJson(json)).toList();
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

  Future<List<ProductResponseModel>> getOwnerStallProductsByCategory(int categoryID) async {
    try {
      Response response = await _dio.get("/owner_stall/category/$categoryID");
      if(kDebugMode) {
        print(response.data.toString());
      }
      return response.data.map((json) => ProductResponseModel.fromJson(json)).toList();
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
}