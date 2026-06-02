import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/product_model.dart';
import 'package:frontend/models/stall_model.dart';
import 'package:frontend/providers/dio_provider.dart';
import 'package:frontend/providers/owner_provider.dart';
import 'package:frontend/providers/stall_provider.dart';
import 'package:frontend/services/owner_stall/owner_stall_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'owner_stall_provider.g.dart';

@riverpod
class OwnerStallCategoryProvider extends _$OwnerStallCategoryProvider {
  @override
  Future<List<CategoryInfoModel>> build() async {
    final ownerID = ref.read(ownerNotifierProvider);
    if (ownerID == null) throw Exception("Not logged in");

    // Wait for the owner stall data to be available before fetching categories
    // Could make this directly retrieve the value tho
    // But for null safety meh
    final stallData = await ref.watch(ownerStallProvider.future);
    final int stallID = stallData.stallID!;

    final ownerStallService = ref.read(ownerStallServiceProvider);
    return await ownerStallService.getOwnerStallCategories(ownerID, stallID);
  }

  Future<dynamic> addNewCategory(String categoryName) async {
    final ownerID = ref.read(ownerNotifierProvider);
    final stallData = ref.read(ownerStallProvider).value;
    if (ownerID == null || stallData == null) return null;

    final int stallID = stallData.stallID!;
    final ownerStallService = ref.read(ownerStallServiceProvider);
    final response = await ownerStallService.addProductCategory(
      ownerID,
      stallID,
      categoryName,
    );
    ref.invalidateSelf();
    return response;
  }

  Future<dynamic> renameCategory(String categoryName) async {
    final ownerID = ref.read(ownerNotifierProvider);
    final stallData = ref.read(ownerStallProvider).value;
    final categoryID = ref.read(currentCategoryProvider);

    if (ownerID == null || stallData == null || categoryID == null) return null;

    final int stallID = stallData.stallID!;
    final ownerStallService = ref.watch(ownerStallServiceProvider);
    final response = await ownerStallService.renameCategory(
      ownerID,
      stallID,
      categoryID,
      categoryName,
    );
    ref.invalidateSelf();
    return response;
  }
}

class CurrentCategory extends Notifier<int?> {
  @override
  int? build() {
    return 0;
  }

  set categoryID(int catID) {
    state = catID;
  }
}

final currentCategoryProvider = NotifierProvider<CurrentCategory, int?>(
  () => CurrentCategory(),
);

@riverpod
class OwnerStallProductsByCategoryProvider
    extends _$OwnerStallProductsByCategoryProvider {
  @override
  Future<List<ProductResponseModel>> build() async {
    final ownerStallService = ref.read(ownerStallServiceProvider);
    final categoryID = ref.read(currentCategoryProvider);
    if (categoryID == null) return [];

    return await ownerStallService.getOwnerStallProductsByCategory(categoryID);
  }

  Future<dynamic> toggleProductStatus(int productID) async {
    final ownerID = ref.read(ownerNotifierProvider);
    if (ownerID == null) return null;

    final ownerStallService = ref.read(ownerStallServiceProvider);
    final response = await ownerStallService.toggleProductStatus(
      ownerID,
      productID,
    );
    ref.invalidateSelf();
    return response;
  }

  Future<dynamic> deleteProduct(int productID) async {
    final ownerID = ref.read(ownerNotifierProvider);
    if (ownerID == null) return null;

    final ownerStallService = ref.read(ownerStallServiceProvider);
    final response = await ownerStallService.deleteProduct(ownerID, productID);
    ref.invalidateSelf();
    return response;
  }

  Future<dynamic> addProduct(ProductCreateModel data) async {
    final ownerID = ref.read(ownerNotifierProvider);
    final stallData = ref.read(ownerStallProvider).value;
    final categoryID = ref.read(currentCategoryProvider);

    if (ownerID == null || stallData == null || categoryID == null) return null;

    final int stallID = stallData.stallID!;
    final ownerStallService = ref.read(ownerStallServiceProvider);
    final response = await ownerStallService.addProduct(
      ownerID,
      categoryID,
      stallID,
      data,
    );
    ref.invalidateSelf();
    return response;
  }
}

@riverpod
class OwnerStall extends _$OwnerStall {
  @override
  Future<StallResponseModel> build() async {
    final ownerID = ref.watch(ownerNotifierProvider);
    if (ownerID == null) throw Exception("Not logged in");
    final ownerService = ref.watch(ownerStallServiceProvider);
    return await ownerService.getOwnerStall(ownerID);
  }

  Future<dynamic> updateStallStatus(int stallID, StallUpdateModel data) async {
    final currentStall = ref.watch(stallServiceProvider);
    final _ = await currentStall.updateStall(stallID, data);
    ref.invalidateSelf();
  }
}

final ownerStallServiceProvider = Provider<OwnerStallService>((ref) {
  final dio = ref.watch(dioProvider);
  return OwnerStallService(dio: dio);
});
