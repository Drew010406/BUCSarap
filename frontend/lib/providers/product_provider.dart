import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/product_model.dart';
import 'package:frontend/models/stall_model.dart';
import 'package:frontend/services/order/order_service.dart';
import 'package:frontend/services/product/product_service.dart';

import 'dio_provider.dart';

class SelectedCategory extends Notifier<CategoryInfoModel?> {
  @override
  CategoryInfoModel? build() {
    return null;
  }

  void selectedCategory(CategoryInfoModel category) {
    state = category;
  }
}

final selectedCategoryProvider =
    NotifierProvider<SelectedCategory, CategoryInfoModel?>(() {
      return SelectedCategory();
    });

final productServiceProvider = Provider<ProductService>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductService(dio: dio);
});

final productsProvider = FutureProvider<List<ProductResponseModel>>((
  ref,
) async {
  final prodService = ref.watch(productServiceProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  if (selectedCategory == null) {
    throw Exception("No category selected");
  }
  final data = await prodService.getProductsByCategory(
    selectedCategory.categoryID!,
  );
  return data;
});

