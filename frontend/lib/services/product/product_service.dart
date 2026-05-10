import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/models/product_model.dart';

class ProductService {
  final Dio? _dio;

  ProductService({dio}) : _dio = dio;

  // Future<List<ProductWithDetailsModel>> getStallProducts(int stallId) async {
  //   try {
  //     Response response = await _dio!.get("/products/$stallId");
  //     if (kDebugMode) {
  //       print(response.data.toString());
  //     }
  //     return response.data
  //         .map((product) => ProductWithDetailsModel.fromJson(product))
  //         .toList();
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       final statusCode = e.response?.statusCode;
  //       final errorData = e.response?.data;
  //
  //       if (statusCode == 500) {
  //         final errorMessage = errorData['detail'] ?? 'Database error';
  //         throw Exception(errorMessage);
  //       } else {
  //         throw Exception(
  //           'Server error: $statusCode = ${errorData['detail'] ?? "Unknown Error"}',
  //         );
  //       }
  //     } else {
  //       throw Exception('Network error: ${e.message}');
  //     }
  //   }
  // }

  Future<List<ProductResponseModel>> getProductsByCategory(
    int categoryID,
  ) async {
    try {
      Response response = await _dio!.get("/products/category/$categoryID");
      if (kDebugMode) {
        print(response.data.toString());
      }
      return (response.data as List)
          .map((product) => ProductResponseModel.fromJson(product))
          .toList();
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

  // Future<List<ProductResponseModel>> getAvailableProducts(int stallId) async {
  //   try {
  //     Response response = await _dio!.get("/products/$stallId/available");
  //     if (kDebugMode) {
  //       print(response.data.toString());
  //     }
  //     return response.data
  //         .map((product) => ProductResponseModel.fromJson(product))
  //         .toList();
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       final statusCode = e.response?.statusCode;
  //       final errorData = e.response?.data;
  //
  //       if (statusCode == 500) {
  //         final errorMessage = errorData['detail'] ?? 'Database error';
  //         throw Exception(errorMessage);
  //       } else {
  //         throw Exception(
  //           'Server error: $statusCode = ${errorData['detail'] ?? "Unknown Error"}',
  //         );
  //       }
  //     } else {
  //       throw Exception('Network error: ${e.message}');
  //     }
  //   }
  // }
}
