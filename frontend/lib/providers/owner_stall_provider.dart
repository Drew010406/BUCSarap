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
    final ownerID = ref.watch(ownerNotifierProvider);
    final stallData = ref.read(ownerStallProvider).value;
    final int stallID = stallData!.stallID!;
    if (ownerID == null) throw Exception("Not logged in");
    final ownerStallService = ref.watch(ownerStallServiceProvider);
    return await ownerStallService.getOwnerStallCategories(ownerID, stallID);
  }

  Future<dynamic> deleteCategory(int categoryID) async {

  }

  Future<dynamic> renameCategory(int categoryID) async {

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

final currentCategoryProvider = NotifierProvider<CurrentCategory, int?>(() => CurrentCategory());
@riverpod
class OwnerStallProductsByCategoryProvider extends _$OwnerStallProductsByCategoryProvider {
  @override
  Future<List<ProductResponseModel>> build() async {
    final ownerStallService = ref.watch(ownerStallServiceProvider);
    final categoryID = ref.watch(currentCategoryProvider);
    return await ownerStallService.getOwnerStallProductsByCategory(categoryID!);
  }

  Future<dynamic> deleteProduct(int ownerID, int productID) async {

  }

  Future<dynamic> addProduct(int ownerID, int stallID, int categoryID) async {

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

