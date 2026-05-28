import 'package:frontend/models/transaction_history_model.dart';
import 'package:frontend/services/queue/queue_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio_provider.dart';

part 'queue_provider.g.dart';

// TODO: change the type into Future<Map<String, dynamic>>, why? kasi feeling ko pedeng gawing single QueueProvider to since both NotifierClasses' return type is List<TransactionHistoryModel>
@riverpod
class PendingQueueProvider extends _$PendingQueueProvider {
  @override
  Future<List<TransactionHistoryModel>> build(int stallID) async {
    final queueService = ref.watch(queueServiceProvider);
    return await queueService.getPendingOrder(stallID);
  }
}

@riverpod
class PreparingQueueProvider extends _$PreparingQueueProvider {
  @override
  Future<List<TransactionHistoryModel>> build(int stallID) async {
    final queueService = ref.watch(queueServiceProvider);
    return await queueService.getPreparingOrder(stallID);
  }
}

// However, I dunno if this is good practice so Imma use the old shit( ata? )
@riverpod
class QueueProvider extends _$QueueProvider {
  @override
  Future<Map<String, dynamic>> build(int stallID) async {
    final queueService = ref.watch(queueServiceProvider);
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
