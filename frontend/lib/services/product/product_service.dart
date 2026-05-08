import 'package:dio/dio.dart';

class ProductService {
  final Dio? _dio;

  ProductService({dio}) : _dio = dio;

  Future<dynamic> getStallProducts(int stallId) async {
    try {} on DioException catch (e) {}
  }

  Future<dynamic> getProductsByCategory(int stallId) async {
    try {} on DioException catch (e) {}
  }

  Future<dynamic> getAvailableProducts(int stallId) async {
    try {} on DioException catch (e) {}
  }
}
