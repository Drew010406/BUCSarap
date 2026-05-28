import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/models/order_details_model.dart';
import 'package:frontend/models/order_line_model.dart';

class OrderService {
  final Dio? _dio;

  OrderService({dio}) : _dio = dio;

  Future<dynamic> checkout(int stallID, String? customerName) async {
    try {
      Response response = await _dio!.post(
        "/orders/create_order",
        data: {"stall_id": stallID, "customer_name": customerName},
      );
      if (kDebugMode) {
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

  Future<dynamic> insertItems(int orderID, Set<OrderLineModel> data) async {
    try {
      Response response = await _dio!.post(
        "/orders/${orderID}/items",
        data: data.toList(),
      );
      if (kDebugMode) {
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

  Future<dynamic> submitOrder(int orderID, Map<String, dynamic> data) async {
    try {
      Response response = await _dio!.post(
        "/orders/${orderID}/submit",
        data: data,
      );
      if (kDebugMode) {
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

  Future<OrderDetailsModel> getOrderDetails(int orderID, int stallID) async {
    try {
      Response response = await _dio!.get(
        "/orders/orders/${orderID}",
        queryParameters: {"stall_id": stallID},
      );
      if (kDebugMode) {
        print(response.data.toString());
      }
      return OrderDetailsModel.fromJson(response.data);
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
