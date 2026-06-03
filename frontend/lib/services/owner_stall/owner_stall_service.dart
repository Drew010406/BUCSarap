import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/models/product_model.dart';
import 'package:frontend/models/stall_model.dart';

class OwnerStallService {
  final Dio _dio;

  const OwnerStallService({required Dio dio}) : _dio = dio;

  Future<StallResponseModel> getOwnerStall(int ownerID) async {
    try {
      Response response = await _dio.get("/users/$ownerID/stall");
      if (kDebugMode) {
        print(response.data.toString());
      }
      return StallResponseModel.fromJson(response.data);
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

  Future<List<CategoryInfoModel>> getOwnerStallCategories(
    int ownerID,
    int stallID,
  ) async {
    try {
      Response response = await _dio.get(
        "/owner_stall/owners/$ownerID/stalls/$stallID/categories",
      );
      if (kDebugMode) {
        print(response.data.toString());
      }
      return (response.data as List)
          .map((json) => CategoryInfoModel.fromJson(json))
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

  Future<List<ProductResponseModel>> getOwnerStallProductsByCategory(
    int categoryID,
  ) async {
    try {
      Response response = await _dio.get("/owner_stall/category/$categoryID");
      if (kDebugMode) {
        print(response.data.toString());
      }
      return (response.data as List)
          .map((json) => ProductResponseModel.fromJson(json))
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

  Future<dynamic> addProduct(
    int ownerID,
    int categoryID,
    int stallID,
    ProductCreateModel data,
  ) async {
    try {
      Response response = await _dio.post(
        "/owner_stallowners/$ownerID/stalls/$stallID/categories/$categoryID/add_product",
        data: data,
      );
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response;
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

  Future<dynamic> deleteProduct(int ownerID, int productID) async {
    try {
      Response response = await _dio.delete(
        "/owner_stall/$ownerID/products/$productID",
      );
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response;
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

  Future<dynamic> toggleProductStatus(int ownerID, int productID) async {
    try {
      Response response = await _dio.patch(
        "/owner_stall/$ownerID/products/$productID/toggle-status",
      );
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response;
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

  Future<dynamic> updateProduct(int ownerID, int productID) async {
    try {
      Response response = await _dio.patch(
        "/owner_stall/$ownerID/products/$productID/toggle-status",
      );
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response;
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

  Future<dynamic> addProductCategory(
    int ownerID,
    int stallID,
    String categoryName,
  ) async {
    try {
      Response response = await _dio.post(
        "/owner_stall/owner/$ownerID/stall/$stallID/product_category/add_category",
        queryParameters: {"category_name": categoryName},
      );
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response;
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

  Future<dynamic> renameCategory(
    int ownerID,
    int stallID,
    int categoryID,
    String categoryName,
  ) async {
    try {
      Response response = await _dio.patch(
        "/owner_stall/owner/$ownerID/stall/$stallID/product_category/$categoryID/rename_category",
        queryParameters: {"new_category_name": categoryName},
      );
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response;
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
