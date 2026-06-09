import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/models/revenue_model.dart';

import '../../models/transaction_history_model.dart';

class HistoryService {
  final Dio? _dio;

  HistoryService({dio}) : _dio = dio;

  Future<dynamic> getProductInfo(int productID) async {
    try {
      Response response = await _dio!.get("/products/product_info/$productID");
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

  Future<dynamic> getStallRevenue(int stallID) async {
    try {
      Response response = await _dio!.get("/history/revenue/$stallID");
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

  Future<RevenueModel> getStallDailyRevenue(int stallID) async {
    try {
      Response response = await _dio!.get("/history/revenue/$stallID/daily");
      if (kDebugMode) {
        print(response.data.toString());
      }
      if (response.data is! Map<String, dynamic>) {
        return const RevenueModel();
      }
      return RevenueModel.fromJson(response.data);
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

  Future<RevenueModel> getStallWeeklyRevenue(int stallID) async {
    try {
      Response response = await _dio!.get("/history/revenue/$stallID/weekly");
      if (kDebugMode) {
        print(response.data.toString());
      }
      if (response.data is! Map<String, dynamic>) {
        return const RevenueModel();
      }
      return RevenueModel.fromJson(response.data);
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

  Future<RevenueModel> getStallMonthlyRevenue(int stallID) async {
    try {
      Response response = await _dio!.get("/history/revenue/$stallID/monthly");
      if (kDebugMode) {
        print(response.data.toString());
      }
      if (response.data is! Map<String, dynamic>) {
        return const RevenueModel();
      }
      return RevenueModel.fromJson(response.data);
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

  Future<dynamic> getStallHistory(int stallID) async {
    try {
      Response response = await _dio!.get("/history/$stallID");
      if (kDebugMode) {
        print(response.data.toString());
      }
      return (response.data);
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

  Future<dynamic> deleteItemHistory(int stallID, int orderID) async {
    try {
      Response response = await _dio!.delete(
        "/history/stall/$stallID/delete_order/$orderID",
      );
      if (kDebugMode) {
        print(response.data.toString());
      }
      return (response.data);
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

  Future<RevenueComparison> getOneDayComparison(
    int stallID,
    int ownerID,
  ) async {
    try {
      Response response = await _dio!.get(
        "/history/$stallID/one_day_comparison",
        queryParameters: {"owner_id": ownerID},
      );
      if (kDebugMode) {
        print(response.data.toString());
      }
      if (response.data is! Map<String, dynamic>) {
        return const RevenueComparison();
      }
      return RevenueComparison.fromJson(response.data);
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

  Future<RevenueComparison> getWeeklyComparison(
    int stallID,
    int ownerID,
  ) async {
    try {
      Response response = await _dio!.get(
        "/history/$stallID/weekly_comparison",
        queryParameters: {"owner_id": ownerID},
      );
      if (kDebugMode) {
        print(response.data.toString());
      }
      if (response.data is! Map<String, dynamic>) {
        return const RevenueComparison();
      }
      return RevenueComparison.fromJson(response.data);
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

  Future<RevenueComparison> getMonthlyComparison(
    int stallID,
    int ownerID,
  ) async {
    try {
      Response response = await _dio!.get(
        "/history/$stallID/monthly_comparison",
        queryParameters: {"owner_id": ownerID},
      );
      if (kDebugMode) {
        print(response.data.toString());
      }
      if (response.data is! Map<String, dynamic>) {
        return const RevenueComparison();
      }
      return RevenueComparison.fromJson(response.data);
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

  Future<List<LastTenDaysRevenue>> getLastTenDaysRevenue(int stallID) async {
    try {
      Response response = await _dio!.get(
        "/history/revenue/$stallID/last_10_days",
      );
      if (kDebugMode) {
        print(response.data.toString());
      }
      if (response.data is! List) {
        return const [];
      }
      return (response.data as List)
          .map((json) => LastTenDaysRevenue.fromJson(json))
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
}
