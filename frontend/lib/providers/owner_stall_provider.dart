import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/product_model.dart';
import 'package:frontend/models/stall_model.dart';
import 'package:frontend/providers/dio_provider.dart';
import 'package:frontend/services/owner_stall/owner_stall_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'owner_stall_provider.g.dart';

@riverpod
class OwnerStallCategoryProvider extends _$OwnerStallCategoryProvider {
  @override
  Future<List<CategoryInfoModel>> build(int ownerID, int stallID) async {
    final ownerStallService = ref.watch(ownerStallServiceProvider);
    return await ownerStallService.getOwnerStallCategories(ownerID, stallID);
  }
}

@riverpod
class OwnerStallProductsByCategoryProvider extends _$OwnerStallProductsByCategoryProvider {
  @override
  Future<List<ProductResponseModel>> build(int categoryID) async {
    final ownerStallService = ref.watch(ownerStallServiceProvider);
    return await ownerStallService.getOwnerStallProductsByCategory(categoryID);
  }
}

final ownerStallServiceProvider = Provider<OwnerStallService>((ref) {
  final dio = ref.watch(dioProvider);
  return OwnerStallService(dio: dio);
});