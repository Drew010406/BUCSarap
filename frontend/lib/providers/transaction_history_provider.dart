import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/order_details_model.dart';
import 'package:frontend/models/transaction_history_model.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:frontend/providers/dio_provider.dart';
import 'package:frontend/providers/stall_provider.dart';
import 'package:frontend/services/history/history_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'transaction_history_provider.g.dart';

@riverpod
class TransactionHistoryProvider extends _$TransactionHistoryProvider {

  @override
  Future<List<TransactionHistoryModel>> build(int stallID) async {
    final historyService = ref.watch(historyServiceProvider);
    final response = await historyService.getStallHistory(stallID);
    return response.map((item) => TransactionHistoryModel.fromJson(item)).toList();
  }


}

final historyServiceProvider = Provider<HistoryService>((ref) {
  final dio = ref.watch(dioProvider);
  return HistoryService(dio: dio);
});