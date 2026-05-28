import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/models/transaction_history_model.dart';

class QueueService {
  final Dio? _dio;

  const QueueService({dio}) : _dio = dio;

  Future<dynamic> getPendingOrder(int stallID) async {
    try {
      Response response = await _dio!.get("/orders/preparing_queue/$stallID");
      if (kDebugMode) {
        print(response.data.toString());
      }
      return (response.data as List).map((json) => TransactionHistoryModel.fromJson(json)).toList();
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

  Future<dynamic> getPreparingOrder(int stallID) async {
    try {
      Response response = await _dio!.get("/orders/queue/$stallID");
      if (kDebugMode) {
        print(response.data.toString());
      }
      return (response.data as List).map((json) => TransactionHistoryModel.fromJson(json)).toList();
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

  Future<dynamic> acceptOrder(int orderID, int stallID) async {
    try {
      Response response = await _dio!.patch(
        "/orders/$orderID",
        queryParameters: {"stall_id": stallID},
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

  Future<dynamic> declineOrder(int orderID, int stallID) async {
    try {
      Response response = await _dio!.patch(
        "/orders/orders/$orderID",
        queryParameters: {"stall_id": stallID},
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
}
