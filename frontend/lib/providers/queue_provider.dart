import 'package:frontend/models/transaction_history_model.dart';
import 'package:frontend/services/queue/queue_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio_provider.dart';
part 'queue_provider.g.dart';

@riverpod
class PendingQueueProvider extends _$PendingQueueProvider {
  @override
  Future<List<TransactionHistoryModel>> build() async {
    /// Bukas nato
    throw UnimplementedError();
  }
}

final queueServiceProvider = Provider<QueueService>((ref) {
  final dio = ref.watch(dioProvider);
  return QueueService(dio: dio);
});