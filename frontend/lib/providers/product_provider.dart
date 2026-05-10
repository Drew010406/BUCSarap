import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/product_model.dart';
import 'package:frontend/models/product_pile_model.dart';
import 'package:frontend/services/product/product_service.dart';

import 'dio_provider.dart';

final productServiceProvider = Provider<ProductService>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductService(dio: dio);
});

final productsProvider = FutureProvider<List<ProductResponseModel>>((ref) async {
  final prodService = ref.watch(productServiceProvider);
  final data = await prodService.getProductsByCategory(1);
  return data;
});