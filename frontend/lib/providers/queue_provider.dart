import 'package:frontend/models/transaction_history_model.dart';
import 'package:frontend/services/queue/queue_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio_provider.dart';
import 'owner_stall_provider.dart';

part 'queue_provider.g.dart';

// TODO: change the type into Future<Map<String, dynamic>>, why? kasi feeling ko pedeng gawing single QueueProvider to since both NotifierClasses' return type is List<TransactionHistoryModel>
@riverpod
class PendingQueueProvider extends _$PendingQueueProvider {
  @override
  Future<List<TransactionHistoryModel>> build() async {
    final stallData = ref.read(ownerStallProvider).value;
    final queueService = ref.read(queueServiceProvider);
    return await queueService.getPendingOrder(stallData!.stallID!);
  }

  Future<dynamic> acceptOrder(int orderID, int stallID) async {
    final queueService = ref.read(queueServiceProvider);
    final response =  await queueService.acceptOrder(orderID, stallID);
    ref.invalidateSelf();
    ref.invalidate(preparingQueueProviderProvider);
    return response;
  }

  Future<dynamic> declineOrder(int orderID, int stallID) async {
    final queueService = ref.read(queueServiceProvider);
    final _ = await queueService.declineOrder(orderID, stallID);
    ref.invalidateSelf();
  }
}

@riverpod
class PreparingQueueProvider extends _$PreparingQueueProvider {
  @override
  Future<List<TransactionHistoryModel>> build() async {
    final stallData = ref.read(ownerStallProvider).value;
    final queueService = ref.read(queueServiceProvider);
    return await queueService.getPreparingOrder(stallData!.stallID!);
  }
}

// However, I dunno if this is good practice so Imma use the old shit( ata? )
@riverpod
class QueueProvider extends _$QueueProvider {
  @override
  Future<Map<String, dynamic>> build(int stallID) async {
    final queueService = ref.read(queueServiceProvider);
    return {
      "pending": await queueService.getPendingOrder(stallID),
      "preparing": await queueService.getPreparingOrder(stallID),
    };
  }
}

final queueServiceProvider = Provider<QueueService>((ref) {
  final dio = ref.watch(dioProvider);
  return QueueService(dio: dio);
});
