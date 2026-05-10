import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/stall_model.dart';
import 'package:frontend/providers/dio_provider.dart';
import 'package:frontend/services/stall/stall_service.dart';

final stallServiceProvider = Provider<StallService>((ref) {
  final dio = ref.watch(dioProvider);
  return StallService(dio: dio);
});

final stallsProvider = FutureProvider<List<StallResponseModel>>((ref) async {
  final stallService = ref.watch(stallServiceProvider);
  final data = await stallService.getStalls();
  return data;
});

// Eto lang naiisip ko talaga tangina AHAHHAHAHA
class SelectedStallNotifier extends Notifier<StallResponseModel?> {
  @override
  StallResponseModel? build() {
    return null;
  }

  void selectStall(StallResponseModel stall) {
    state = stall;
  }
}

final selectedStallProvider = NotifierProvider<SelectedStallNotifier, StallResponseModel?>(() {
  return SelectedStallNotifier();
});

final stallsWithCategoriesProvider = FutureProvider<StallWithCategories>((ref) {
  final stallService = ref.watch(stallServiceProvider);
  final selectedStall = ref.watch(selectedStallProvider);
  if (selectedStall == null) {
    throw Exception('No stall selected');
  }
  final data = stallService.getStallWithCategories(selectedStall.stallID!);
  return data;
});